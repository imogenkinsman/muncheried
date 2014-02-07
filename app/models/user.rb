class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email,
            presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  validates :secret_key,
            presence: true, uniqueness: true, length: { is: 22 }

  validates :subscribed,
            presence: true

  validates :emailed_at,
            presence: true, default: 2.days.ago
end
