module ApplicationHelper
  
  # Displays the proper title no matter what page you go to
  def titler
    base_title = "The Primmer Family Website"
    if @title.nil?
      base_title
    else
      "#{base_title} - #{@title}"
    end
  end
  
  # Displays logo (height*0.714285714, width*1.26)
  def main_logo(o = {})
    if !o.blank?
      if o[:width] && o[:height]
        w = o[:width]
        h = o[:height]
      elsif o[:width] && !o[:height]
        w = o[:width]
        h = (o[:width]*1.26).to_i
      elsif o[:height] && !o[:width]
        w = (o[:height]*0.714285714).to_i
        h = o[:height]
      else
        w = 250
        h = 315
      end
      if o[:padding]
        p = o[:padding]
      end
    end
    image_tag("logos/pf_logo.png", :alt => "Primmer Family", :class => "logo_class", :id => "logo_id", :width => "#{w}px", :height => "#{h}px", :padding => "#{p}px")
  end

  # def image_dim(source, options = {})
  #   if !options[:size]
  #     @@image_size ||= {}
  #     if !@@image_size[source]
  #       @@image_size[source] = FastImage.size(::Rails.root.to_s+"public/#{source}").join("x")
  #     end
  #     options = options.merge(:size => @@image_size[source])
  #   end
  #   super(source,options)
  # end
  
  # c = class, w = width, h = height, title = title, source = source url
  def image_return(c, ws, hs, title, source)
    if c == 1
      c_art = "picwidth"
      w = 200
      h = 200*ws
    elsif c == 2
      c_art = "picheight"
      h = 200
      w = 200*hs
    elsif c == 3
      c_art = "potmwidth"
      w = 280
      h = 280*ws
    elsif c == 4
      c_art = "potmheight"
      h = 280
      w = 280*hs
    end
    image_tag source, :class => c_art, :width => "#{w}px", :height => "#{h}px", :title => title
  end
  
  # gets and returns image dimension and image tag
  def image_dim(source, title, o = {})
    s = source.split("?")
    size = FastImage.size("public/#{s[0]}")
    puts "#{size}"
    
    ws = size[1].to_f/size[0]
    hs = size[0].to_f/size[1]
    
    if !o.empty?
      potm_class = true
    else
      potm_class = false
    end

    if !size.nil?
      if size[0] > size[1]
        if potm_class
          image_return(3, ws, hs, title, source)
        else
          image_return(1, ws, hs, title, source)
        end
      elsif size[1] > size[0]
        if potm_class
          image_return(4, ws, hs, title, source)
        else
          image_return(2, ws, hs, title, source)
        end
      elsif size[1] == size[0]
        if potm_class
          image_return(3, ws, hs, title, source)
        else
          image_return(1, ws, hs, title, source)
        end
      end
    else
      image_return(1, ws, hs, title, source)
    end
  end
  
  # Gets potm month
  def the_month
    month = case Time.now.month
    when 1
      "January"
    when 2
      "February"
    when 3
      "March"
    when 4
      "April"
    when 5
      "May"
    when 6
      "June"
    when 7
      "July"
    when 8
      "August"
    when 9
      "September"
    when 10
      "October"
    when 11
      "November"
    when 12
      "December"
    else 
      Time.now.year
    end
  end

  def get_month(month, day)
    t = Time.new(Time.now.year,month,day)
    t.strftime("%B %-d")
  end

  def bday_today_exists?
    b = Birthday.where(:month => Time.now.month, :day => Time.now.day).exists?
  end

  def toppic_exists(article)
    z = 0
    article.pictures.each do |pic|
      if pic.toppic == 1
        z += 1
      end
    end  
    z > 0 ? true : false
  end

  def comment_user(user)
    u = User.find_by_user_id(user)
    u.username
  end

  def get_year
    @year = Time.now.year
  end

  def month_now
    @month = Time.now.month
  end
  
  # loads archive Pictures of the Month
  def archive_potm(potm)
    @poftm = Hash.new
    pofthem = {}
    min = PicOfTheMonth.where("year > #{1}").minimum("year")
    get_year
    
    year = @year
    unless potm.empty?
      begin
        pofthem[year] = {}
        for i in 1..12
          month = month_get(i)
          pofthem[year][month] = nil
        end
        potm.each do |p|
          if p.year == year
            if p.month <= @month.to_i
              month = month_get(p.month)
              pofthem[year].merge!({month => {:title => p.title, :url => p.picmonth.url}})
            end
          end
        end
        year -= 1
      end while year >= min
      @poftm.merge!(pofthem)
    end

    # year = @year
    # begin
    #   for i in 1..12
    #     month = month_get(i)
    #     if @poftm[year][month].nil?
    #       @poftm[year][month] = nil
    #     end
    #   end
    #   @poftm.sort
    #   year -= 1
    # end while year >= min
    return
  end

  def month_get(month)
    m = Time.new(2014,month)
    m.strftime("%B")
  end
  



  private

      def encrypt_password
        salt = make_salt if new_record?
        encrypted_password = encrypt(password,salt)
      end

      def encrypt_forgot(string,salt)
        secure_hash("#{salt}--#{string}")
      end
      
      def make_salt_forgot(email)
        secure_hash("#{Time.now.utc}--#{email}")
      end
      
      def secure_hash_forgot(string)
        Digest::SHA2.hexdigest(string)
      end

end
