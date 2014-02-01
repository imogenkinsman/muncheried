class StaticController < ApplicationController
  def sales
    @meals = Meal.all
  end

  def about
  end
end
