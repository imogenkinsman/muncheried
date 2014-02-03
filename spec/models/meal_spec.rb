describe Meal do
  it "can be instantiated" do
    meal = Meal.new
    expect(meal).to be_an_instance_of(Meal)
  end

end