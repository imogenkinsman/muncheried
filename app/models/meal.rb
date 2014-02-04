class Meal < ActiveRecord::Base
  validates :name,
            presence: true

  validates :category,
            presence: true, inclusion: { in: %w(Entree Side) }

  validates :price,
            presence: true, numericality: { less_than: 15 }

end
