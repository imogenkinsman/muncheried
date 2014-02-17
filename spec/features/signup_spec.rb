feature "Signing Up" do

  scenario "Signing up with valid email" do
    visit root_path
    fill_in 'email', with: 'test@thezets.com'
    click_button 'Submit'
    #expect
  end

end