feature 'filter spaces by check in date availability' do
  scenario 'user selects check-in date and available properties appear' do
    User.create(
      :user_name => "Someone",
      :email => "something@someone.somewhat",
      :password => "healthybananas",
    )

    space = Space.create(
      :space_name => "Central appartment",
      :description => "close to the station",
      :price => "50",
      :user_id => "1",
      :available_from => "2019-08-01",
      :available_to => "2019-08-03"
    )

    space = Space.create(
      :space_name => "Windmill",
      :description => "Great views",
      :price => "150",
      :user_id => "1",
      :available_from => "2019-08-05",
      :available_to => "2019-08-07"
    )

    visit('/sessions/new')
    fill_in "email", with: "something@someone.somewhat"
    fill_in "password", with: "healthybananas"
    click_button("Sign in")

    fill_in 'from', :with => '2019/08/02' #check how to do capybara test for filling in a calendar

    expect(page).to have_content("Central appartment")
    expect(page).not_to have_content("Windmill")
  end
end
