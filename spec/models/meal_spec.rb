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
    expect(build(:meal, category: 'Drink')).to be_valid
  end

  it 'is invalid without a price' do
    expect(build(:meal, price: nil)).not_to be_valid
  end

  it 'is invalid if price is negative or greater than 15' do
    expect(build(:meal, price: 15.23)).not_to be_valid
    expect(build(:meal, price: -1)).not_to be_valid
    expect(build(:meal, price: 0)).not_to be_valid
    expect(build(:meal, price: 14)).to be_valid
  end

  describe 'class method available' do

    it 'returns the currently available meals' do
      create(:meal, name: 'Chicken')
      create(:meal, name: 'Salad', created_at: 3.days.ago)
      create(:meal, name: 'Pasta', remaining: 0)
      expect(Meal.available.map(&:name)).to eq ['Chicken']
    end

  end

end