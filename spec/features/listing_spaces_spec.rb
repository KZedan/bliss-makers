feature 'listing available spaces' do
  scenario 'the spaces are listed' do
    User.create(
      :user_name => "Someone",
      :email => "something@someone.somewhat",
      :password => "healthybananas",
    )

  visit('/sessions/new')
  fill_in "email", with: "something@someone.somewhat"
  fill_in "password", with: "healthybananas"
  click_button("Sign in")

    expect(page).to have_content 'Loft Space'
    # expect(page).to have_content 'Cool'
    # expect(page).to have_content '100'
  end
end
 
