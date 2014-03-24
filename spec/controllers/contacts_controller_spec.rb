require 'spec_helper'

describe ContactsController do
  render_views

  before(:each) do
    @base_title = "The Primmer Family Website"
    Factory(:pic_of_the_month)
    Factory(:counter)
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
