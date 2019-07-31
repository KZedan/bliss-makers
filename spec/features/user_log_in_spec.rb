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
end