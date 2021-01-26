class Like < ApplicationRecord

  def self.toggle_like post_id, user_id
    like = Like.find_or_initialize_by(post_id: post_id, user_id: user_id)
    if like.persisted?
      like.destroy!
      return false
    end
    like.save!
    true
  end
end
