class MealsController < ApplicationController
  def index
    @meal_categories = Meal.available.group_by(&:category)
  end
end