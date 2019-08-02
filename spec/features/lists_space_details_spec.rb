feature 'Listing' do
  scenario 'lists space details for specific property' do
    visit('/sessions/new')
    fill_in "email", with: "somebody@someemail.com"
    fill_in "password", with: "somebody'spassword"
    click_button("Sign in")

    click_button("Details")
    expect(page).to have_content("Big Ben")
    expect(page).to have_content("it's a big clock")
    expect(page).to have_content("25000")
  end
end

