require 'spec_helper'

describe Admin::PicOfTheMonthsController do
  render_views

  before(:each) do
    @base_title = "The Primmer Family Website"
    Factory(:pic_of_the_month)
    Factory(:counter)
  end



end
