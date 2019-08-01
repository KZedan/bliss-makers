feature "Authentication" do
  scenario "user can log in" do
    User.create( 
      :user_name => "Someone",
      :email => "something@someone.somewhat",
      :password => "healthybananas",
      )
        
    visit('/sessions/new')
    fill_in "email", with: "something@someone.somewhat"
    fill_in "password", with: "healthybananas"
    click_button("Sign in")

    expect(page).to have_content("Welcome to Bliss, Someone!")
  end

  scenario "user gives incorrect email address" do
    User.create( 
      :user_name => "Someone",
      :email => "something@someone.somewhat",
      :password => "healthybananas",
      )
        
    visit('/sessions/new')
    fill_in "email", with: "wrongemail@wrong.email"
    fill_in "password", with: "healthybananas"
    click_button("Sign in")

    expect(page).not_to have_content("Welcome to Bliss, Someone!")
    expect(page).to have_content("Please check your email and/or password.")
   end
end

