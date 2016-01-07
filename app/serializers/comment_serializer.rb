class CommentSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :name, :body
  belongs_to :post
  url [:post, :comment]
end
