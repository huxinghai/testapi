class PostSerializer < ActiveModel::Serializer
  cache key: 'posts', expires_in: 3.hours
  attributes :title, :body
  has_many :comments
  url :post
end
