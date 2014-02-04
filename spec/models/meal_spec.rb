describe Meal do
  it 'can be instantiated' do
    meal = Meal.new
    expect(meal).to be_an_instance_of(Meal)
  end

  it 'has a valid factory' do
    expect(build(:meal)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:meal, name: nil)).not_to be_valid
  end

  it 'is invalid without a category' do
    expect(build(:meal, category: nil)).not_to be_valid
  end

  it 'is invalid if not a specific category' do
    expect(build(:meal, category: 'Alcohol')).not_to be_valid
    expect(build(:meal, category: 'Entree')).to be_valid
    expect(build(:meal, category: 'Side')).to be_valid
  end

  it 'is invalid without a price' do
    expect(build(:meal, price: nil)).not_to be_valid
  end

  it 'is invalid if price is greater than 15' do
    expect(build(:meal, price: 15.23)).not_to be_valid
    expect(build(:meal, price: 14)).to be_valid
  end
end