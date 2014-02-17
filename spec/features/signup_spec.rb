feature "Signing Up" do

  scenario "Signing up with valid email" do
    visit root_path
    fill_in 'email', with: 'test@thezets.com'
    expect{click_button 'Submit'}.to change(User, :count).from(0).to(1)
    expect(page).to have_content 'Successfully added test@thezets.com'
  end

end