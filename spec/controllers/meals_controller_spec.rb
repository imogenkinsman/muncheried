describe MealsController do
  describe "GET #index" do
    it "populates an array of meals" do
      meals = create_list(:meal, 3)
      get :index
      expect(assigns(:meals)).to eq(meals)
    end

    it "assigns image orientations" do
      create_list(:meal, 2)
      get :index
      expect(assigns(:image_side).first).to eq 'left'
      expect(assigns(:image_side).last).to eq 'right'
    end
  end
end