require 'pry'
class PostSerializer < ActiveModel::Serializer
  binding.pry
  attributes :id, :title, :body
end
