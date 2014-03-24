class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  before_filter :dates
  before_filter :potm_load
  before_filter :hit_counter_load
  before_filter :birthday_load
  before_filter :top_ten
  before_filter :newsletter_load
  
  # loads potm based on current month and year, returns default picture if no record found
  def potm_load
    @potmvar = PicOfTheMonth.find_by_month_and_year(@month, @year)
    if !@potmvar.nil?
      return @potmvar
    else
      @potmvar = PicOfTheMonth.find_by_month_and_year(1,1)
      return @potmvar
    end
  end

  def birthday_load
    bday_args(@month)
    @bdays = Birthday.where(:month => @months).order("month ASC, day ASC")
  end

  def top_ten
    @topten = Article.last(10)
  end

  def newsletter_load
    @news = Newsletter.new
  end

  private
      
      # Allows the passage of local variables to the view instead of instance variables
      def locals(values)
        render locals: values
      end

      def hit_counter_load
        @counter = Counter.last
      end

      def dates
        time = Time.now
        @month = time.month
        @year = time.year
        @day = time.day
      end

      def bday_args(month_now)
        case month_now
        when 11
          @months = [11,12,1]
        when 12
          @months = [12,1,2]
        else
          @months = [month_now,month_now+1,month_now+2]
        end
      end

#, :type => :image, :src => image_path("logos/search_logo.png")
end
