require 'spec_helper'

describe Meal do
  it "can be instantiated" do
    Meal.new.should be_an_instance_of(Meal)
  end

end