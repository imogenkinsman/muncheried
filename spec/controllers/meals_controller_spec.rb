describe MealsController do
  describe 'GET #index' do
    it 'populates an array of meals' do
      meals = create_list(:meal, 3)
      get :index
      expect(assigns(:meals)).to eq(meals)
    end

    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end
end