feature "Register" do
  scenario "Visitor signs up for a new account" do
    visit('/signup')
    fill_in "user_name", with: "somebody"
    fill_in "email", with: "somebody@someemail.com"
    fill_in "password", with: "somebody'spassword"
    fill_in "password_confirm", with: "somebody'spassword"
    click_button("Submit")
    expect(page).to have_content("Welcome to Bliss!")
  end
end