class Meal < ActiveRecord::Base
  validates :name,
            presence: true

  validates :category,
            presence: true, inclusion: { in: %w(Entree Side Drink) }

  validates :price,
            presence: true, numericality: { greater_than: 0, less_than: 15 }

  alias_attribute :to_s, :name

  # returns all meals still available to order
  def self.available
    self.where('created_at > ? AND (remaining IS NULL OR remaining > 0)', 10.hours.ago)
  end

end
