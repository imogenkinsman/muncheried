class Meal < ActiveRecord::Base
  validates :name,
            presence: true

  validates :category,
            presence: true, inclusion: { in: %w(Entree Side Drink) }

  validates :price,
            presence: true, numericality: { greater_than: 0, less_than: 15 }

  after_create :update_twitter

  alias_attribute :to_s, :name

  # Returns all meals still available to order.
  #
  # @param [Hash] opts an options hash
  # @option opts [String] :category the category of meal to return
  def self.available(opts = {})
    if opts.include?(:category)
      self.where('updated_at > ? AND (remaining IS NULL OR remaining > 0) AND category = ?', 10.hours.ago, opts[:category])
    else
      self.where('updated_at > ? AND (remaining IS NULL OR remaining > 0)', 10.hours.ago)
    end
  end

  private

  # Create a twitter post for a Meal.
  # Should only be used with after_create hook.
  #
  # @private
  def update_twitter
    client = TwitterClient.new
    client.post(self) unless self.remaining == 0
  end

end
