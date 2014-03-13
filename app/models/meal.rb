class Meal < ActiveRecord::Base
  validates :name,
            presence: true

  validates :category,
            presence: true, inclusion: { in: %w(Entree Side Drink) }

  validates :price,
            presence: true, numericality: { greater_than: 0, less_than: 15 }

  after_create :create_twitter_update

  alias_attribute :to_s, :name

  def create_twitter_update
    client = TwitterClient.new
    client.post(self)
  end

  # returns all meals still available to order
  def self.available(opts = {})
    if opts.include?(:category)
      self.where('updated_at > ? AND (remaining IS NULL OR remaining > 0) AND category = ?', 10.hours.ago, opts[:category])
    else
      self.where('updated_at > ? AND (remaining IS NULL OR remaining > 0)', 10.hours.ago)
    end
  end

end
