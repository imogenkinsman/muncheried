class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  validates :secret_key,
            presence: true, uniqueness: true, length: { is: 22 }

  validates_inclusion_of :subscribed,
                         in: [true, false]

  # returns all users that are "safe" to email:
  # those who (1) haven't been emailed today and (2) are still active
  def self.get_recipients
    User.where('emailed_at < ? AND subscribed = true', 11.hours.ago)
  end

end