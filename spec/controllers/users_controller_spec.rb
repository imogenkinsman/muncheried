describe UsersController do

  describe 'post #create' do

    let(:email) { 'test@userscontroller.com' }

    it 'creates a new user' do
      expect{ post :create, email: email }.to change{ User.count }.from(0).to(1)
    end

    it 'gives a json response for successes' do
      post :create, email: email
      expect(response).to be_success
      expect(response.body).to eq({ type: 'success', message: "Successfully added #{email}"}.to_json)
    end

    it 'gives a json response for failures' do
      2.times { post :create, email: email }
      expect(response.body).to eq({ type: 'error', message: "Unable to add #{email}"}.to_json)
    end

    it 'creates a secret key for the user' do
      post :create, email: email
      user = User.find_by(email: email)
      expect(user.secret_key.length).to eq 22
    end

  end

  describe 'get #unsubscribe' do

    let(:user) { create(:user) }

    it 'unsubscribes a user' do
      expect(user.subscribed).to be_true
      get :unsubscribe, { id: user.id, key: user.secret_key }

      user.reload

      expect(user.subscribed).to be_false
      expect(response).to redirect_to root_path
      expect(flash[:success]).to eq "Successfully unsubscribed #{user.email} from MunchAlerts"
    end

    it "does not unsubscribe a user if secret key doesn't match" do
      expect(user.subscribed).to be_true
      get :unsubscribe, { id: user.id, key: '12345' }

      user.reload

      expect(user.subscribed).to be_true
    end

  end

end