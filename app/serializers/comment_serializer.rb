class CommentSerializer < ActiveModel::Serializer
  cache key: 'comments', expires_in: 5.minutes

  attributes :name, :body
  belongs_to :post
end
