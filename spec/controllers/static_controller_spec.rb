describe StaticController, :type => :controller do
  describe "GET #sales" do
    it "populates an array of meals" do
      meals = create_list(:meal, 3)
      get :sales
      expect(assigns(:meals)).to eq(meals)
    end
  end
end