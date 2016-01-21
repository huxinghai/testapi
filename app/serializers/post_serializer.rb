class PostSerializer < ActiveModel::Serializer
  cache key: 'posts', expires_in: 5.minutes
  attributes :title, :body
  has_many :comments
end
