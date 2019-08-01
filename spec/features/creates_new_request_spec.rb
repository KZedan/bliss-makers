feature 'Requests' do
  scenario 'submits a request' do
    User.create(
      :user_name => "Someone",
      :email => "something@someone.somewhat",
      :password => "healthybananas",
    )

    visit ('/details')
    fill_in 'user_name', with 'Someone'
    fill_in 'email', with 'something@someone.somewhat'
    click_button('Request')

    expect(page).to have_content('Massive clock')
    expect(page).to have_content('not confirmed')
  end
end
