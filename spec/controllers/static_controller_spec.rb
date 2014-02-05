describe StaticController do
  describe 'GET #faq' do
    it 'renders the :faq view' do
      get :faq
      expect(response).to render_template :faq
    end
  end

  describe 'GET #about' do
    it 'renders the :about view' do
      get :about
      expect(response).to render_template :about
    end
  end
end