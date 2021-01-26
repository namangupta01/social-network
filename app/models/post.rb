class Post < ApplicationRecord
  has_many :likes

  attr_accessor :likes_count

  def get_likes_count
    likes.count
  end

  def self.set_likes_count posts
    post_ids = posts.map(&:id)
    post_to_likes_count_map = Like.where(post_id: post_ids).group(:post_id).count
    posts.each { |post| post.likes_count = post_to_likes_count_map[post.id].to_i }
  end

  def as_json(options={})
    PostSerializer.new(self).as_json(root: false)
  end

end
