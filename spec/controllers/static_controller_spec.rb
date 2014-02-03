describe StaticController, :type => :controller do
  describe "GET #sales" do
    it "populates an array of meals" do
      meals = create_list(:meal, 3)
      get :sales
      expect(assigns(:meals)).to eq(meals)
    end

    it "assigns image orientations" do
      create_list(:meal, 2)
      get :sales
      expect(assigns(:image_side).first).to eq 'left'
      expect(assigns(:image_side).last).to eq 'right'
    end
  end
end