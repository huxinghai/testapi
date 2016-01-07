class PostSerializer < ActiveModel::Serializer
  cache key: 'post', expires_in: 3.hours
  attributes :id, :title, :body
end
