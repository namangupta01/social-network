class FollowerFolloweeMapping < ApplicationRecord

  def self.toggle_follow follower_id, followee_id
    mapping = FollowerFolloweeMapping.find_or_initialize_by(follower_id: follower_id, followee_id: followee_id)
    if mapping.persisted?
      mapping.destroy!
      return false
    end
    mapping.save!
    true
  end
end
