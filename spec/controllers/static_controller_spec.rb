describe StaticController, :type => :controller do
  describe "GET #sales" do
    it "populates an array of meals" do
      meals = create_list(:meal, 3)
      get :sales
      assigns(:meals).should eq(meals)
    end
  end
end