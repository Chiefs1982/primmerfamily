require 'spec_helper'

describe ArticlesController do
  render_views

  before(:each) do
    @base_title = "The Primmer Family Website"
    Factory(:pic_of_the_month)
    Factory(:counter)
  end

  describe "GET 'article show'" do
    before(:each) do
      @article = Factory(:article)
      get :show, :id => @article.article_id
    end

    describe "when not signed in" do

      it "returns http success" do
        response.should be_success
      end

      it "should have the right title" do
        response.should have_selector("title", :content => "#{@base_title} - #{@article.article_header}")
      end

      it "should have a sign-in link" do
        response.should have_selector("a", :content => "Sign in")
      end
      
    end # describe when not signed in

  end # describe GET family_tree

  

end
