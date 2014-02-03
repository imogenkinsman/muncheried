class StaticController < ApplicationController
  def sales
    @meals = Meal.all
    @image_side = @meals.each_index.map { |i| i.even? ? 'left' : 'right' }
  end
end
