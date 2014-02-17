describe UsersController do

  describe 'post #create' do

    it 'creates a new user' do
      expect{ post :create, email: 'a@userscontroller.com' }.to change{ User.count }.from(0).to(1)
    end

    it 'gives header-only responses' do
      post :create, email: 'c@userscontroller.com'
      expect(response.code).to eq '201'
      expect(response.body.strip.empty?).to be_true
    end

    it 'creates a secret key for the user' do
      post :create, email: 'c@userscontroller.com'
      user = User.find_by(email: 'c@userscontroller.com')
      expect(user.secret_key.length).to eq 22
    end

  end

  describe 'get #unsubscribe' do

    before :each do
      @user = create(:user)
    end

    it 'unsubscribes a user' do
      expect(@user.subscribed).to be_true
      get :unsubscribe, { id: @user.id, key: @user.secret_key }

      @user.reload

      expect(@user.subscribed).to be_false
      expect(response).to redirect_to root_path
      expect(flash[:success]).to eq 'Successfully unsubscribed test@aol.com from MunchAlerts'
    end

    it "does not unsubscribe a user if secret key doesn't match" do
      expect(@user.subscribed).to be_true
      get :unsubscribe, { id: @user.id, key: '12345' }

      @user.reload

      expect(@user.subscribed).to be_true
    end

  end

end