class MealsController < ApplicationController
  def index
    @meals = Meal.all
    @image_side = @meals.each_index.map { |i| i.even? ? 'left' : 'right' }
  end
end