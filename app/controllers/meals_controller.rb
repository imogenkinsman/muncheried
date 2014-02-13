class MealsController < ApplicationController
  def index
    @meals = Meal.available
    #TODO: can probably move this logic to the view - more clutter there, but better semantics
    @image_side = @meals.each_index.map { |i| i.even? ? 'left' : 'right' }
  end
end