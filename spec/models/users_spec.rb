describe User do

  it 'can be instantiated' do
    user = User.new
    expect(user).to be_an_instance_of(User)
  end

end