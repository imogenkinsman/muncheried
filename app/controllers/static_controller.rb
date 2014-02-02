class StaticController < ApplicationController
  def sales
    @meals = Meal.all
    @sides = @meals.each_index.map { |i| i.even? ? 'left' : 'right' }
  end

  def about
  end
end
