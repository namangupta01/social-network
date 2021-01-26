class User < ApplicationRecord
  has_many :followee_mappings, foreign_key: 'follower_id', class_name: 'FollowerFolloweeMapping'
  has_many :follower_mappings, foreign_key: 'followee_id', class_name: 'FollowerFolloweeMapping'

  before_save :encrypt_password
  after_save :clear_password

  attr_accessor :password

  def get_timeline_posts
    user_ids = followee_mappings.pluck(:followee_id)
    user_ids << id
    Post.where(user_id: user_ids).order('id desc')
  end

  def self.get_user_for_token(token)
    puts token
    user_api_key = UserApiKey.where(user_access_token: token).where('expiry > ?', Time.zone.now ).first
    return user_api_key.user if user_api_key
    nil
  end

  def encrypt_password
    write_attribute(:encrypted_password, Digest::SHA1.hexdigest(password)) if password
  end

  def password_matches entered_password
    encrypted_enter_password = Digest::SHA1.hexdigest(entered_password)
    encrypted_enter_password == encrypted_password
  end

  def clear_password
    password = nil
  end

  def check_password_and_get_token entered_password
    return nil unless password_matches entered_password
    token = SecureRandom.hex
    uak = UserApiKey.create(user_id: id, user_access_token: token, expiry: Date.today + 15.days)
    token
  end
end
