require 'spec_helper'

describe UsersController do
  render_views

  before(:each) do
    @base_title = "The Primmer Family Website"
    Factory(:pic_of_the_month)
    Factory(:counter)
  end

  describe "GET 'sign up'" do

    describe "when not signed in" do

      it "returns http success" do
        get :new
        response.should be_success
      end

      it "should have the right title" do
        get :new
        response.should have_selector("title", :content => "#{@base_title} - Sign Up")
      end

      it "should have a sign-in link" do
        get :new
        response.should have_selector("a", :content => "Sign in")
      end
      
    end # describe when not signed in

    describe "when signed in" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
      end

      it "should have the right 'Hello' text" do
        get :new
        response.should redirect_to(root_path)
      end

    end # describe when signed in

  end # describe GET signin

end
