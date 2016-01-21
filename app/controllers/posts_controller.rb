class PostsController < ApplicationController
  def show
    @post = Rails.cache.fetch("post_#{params[:id]}", :expires_in => 5.minutes) do
       data = Post.find(params[:id])
       get_serializer(data, serializer: PostSerializer).as_json
    end
    render json: @post
  end
end
