require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "The Primmer Family Website"
    Factory(:pic_of_the_month)
    Factory(:counter)
  end

  describe "GET 'home'" do
    before(:each) do
      @article = Factory(:article)
    end

    describe "when not signed in" do
            
      it "should be successful" do
        get :home
        response.should be_success
      end
      
      it "should have the right title" do
        get :home
        response.should have_selector("title", :content => "#{@base_title} - Home")
      end

      it "should have a sign-in link" do
        get :home
        response.should have_selector("a", :content => "Sign in")
      end

      it "should have article links" do
        get :home
        response.should have_selector("a", :content => "#{@article.article_link}")
      end

    end # describe when not signed in

    describe "when signed in" do
      before(:each) do
        @user = test_sign_in(Factory(:user))
      end
      
      it "should contain a welcome message for user" do
        get :home
        response.should have_selector("div", :content => "Welcome, #{@user.firstname}")
      end

      it "should have user name as a link" do
        get :home
        response.should have_selector("a", :content => "#{@user.firstname}")
      end

      it "should contain a logout link" do
        get :home
        response.should have_selector("a", :content => "logout")
      end

    end # describe when signed in


  end # describe GET home

  describe "GET 'about'" do
    before(:each) do
      get :about
    end

    describe "when not signed in" do

      it "returns http success" do
        response.should be_success
      end

      it "should have the right title" do
        response.should have_selector("title", :content => "#{@base_title} - About")
      end

      it "should have a sign-in link" do
        response.should have_selector("a", :content => "Sign in")
      end
      
    end # describe when not signed in

  end # describe GET about

  describe "GET 'archive'" do
    before(:each) do
      get :archive
    end

    describe "when not signed in" do

      it "returns http success" do
        response.should be_success
      end

      it "should have the right title" do
        response.should have_selector("title", :content => "#{@base_title} - Archive")
      end

      it "should have a sign-in link" do
        response.should have_selector("a", :content => "Sign in")
      end
      
    end # describe when not signed in

  end # describe GET archive

  describe "GET 'miles'" do
    before(:each) do
      get :miles
    end

    describe "when not signed in" do

      it "returns http success" do
        response.should be_success
      end

      it "should have the right title" do
        response.should have_selector("title", :content => "#{@base_title} - Miles")
      end

      it "should have a sign-in link" do
        response.should have_selector("a", :content => "Sign in")
      end
      
    end # describe when not signed in

  end # describe GET miles

  describe "GET 'vivian'" do
    before(:each) do
      get :vivian
    end

    describe "when not signed in" do

      it "returns http success" do
        response.should be_success
      end

      it "should have the right title" do
        response.should have_selector("title", :content => "#{@base_title} - Vivian")
      end

      it "should have a sign-in link" do
        response.should have_selector("a", :content => "Sign in")
      end
      
    end # describe when not signed in

  end # describe GET vivian

  describe "GET 'family_tree'" do
    before(:each) do
      get :family_tree
    end

    describe "when not signed in" do

      it "returns http success" do
        response.should be_success
      end

      it "should have the right title" do
        response.should have_selector("title", :content => "#{@base_title} - Family Tree")
      end

      it "should have a sign-in link" do
        response.should have_selector("a", :content => "Sign in")
      end
      
    end # describe when not signed in

  end # describe GET family_tree

end
