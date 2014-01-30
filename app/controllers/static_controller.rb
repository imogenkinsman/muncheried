class StaticController < ApplicationController
  def sales
    @meals = Meal.all
  end
end
