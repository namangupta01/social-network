class PostSerializer < ActiveModel::Serializer
  attributes :body, :likes_count
end
