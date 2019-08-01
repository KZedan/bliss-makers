require 'user'

describe User do
  describe ".authenticate" do
    it "returns nil given an incorrect email address" do
      user = User.create(
        :user_name => "Someone",
        :email => "something@someone.somewhat",
        :password => "healthybananas",
      )

      expect(User.authenticate(:email => "nottherightemail@yeah.not", :password => "healthybananas")).to be_nil
    end
  end
end
