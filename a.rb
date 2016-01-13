# Use Rspec test this code is right
puts -> {
  
  class PostSerializer < ActiveModel::Serializer
    cache key: 'posts', expires_in: 3.hours
    attributes :title, :body
    has_many :comments
    url :post
  end
  
  class CommentSerializer < ActiveModel::Serializer
    attributes :name, :body
    belongs_to :post
    url [:post, :comment]
  end

  class PostSerializer < ActiveModel::Serializer
    attributes :id, :body
    # look up :subject on the model, but use +title+ in the JSON
    attribute :subject, :key => :title
    has_many :comments
  end

  class PostsController < ApplicationController
    def show
      @post = Post.find(params[:id])
      render json: @post, serializer: PostSerializer
    end
  end
  
}[]
