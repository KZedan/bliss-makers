feature 'add a new listing' do
  scenario 'user adds a listing' do
    User.create(
        :user_name => "Someone",
        :email => "something@someone.somewhat",
        :password => "healthybananas",
      )

    visit('/sessions/new')
    fill_in "email", with: "something@someone.somewhat"
    fill_in "password", with: "healthybananas"
    click_button("Sign in")

    visit '/spaces/new'
    fill_in 'space_name', with: 'Big Ben'
    fill_in 'description', with: 'Massive clock'
    fill_in 'price', with: '750'
    click_button 'Submit'
    expect(page).to have_content 'Big Ben'
    expect(page).to have_content 'Massive clock'
    expect(page).to have_content '750'
  end
end
