describe User do

  it 'can be instantiated' do
    user = User.new
    expect(user).to be_an_instance_of(User)
  end

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid without an email' do
    expect(build(:user, email: nil)).not_to be_valid
  end

  it 'is invalid without a valid email address' do
    expect(build(:user, email: 'test@')).not_to be_valid
    expect(build(:user, email: '@something.com')).not_to be_valid
    expect(build(:user, email: 'test@test.com')).to be_valid
  end

  it 'is invalid if the email isn\'t unique' do
    expect(build(:user, email: 'unique@test.com')).to be_valid
    create(:user, email: 'unique@test.com')
    expect(build(:user, email: 'unique@test.com')).to be_invalid
  end

end