class MealsController < ApplicationController
  def index
    @meals = Meal.available
  end
end