module AdminHelper

  def month
    months = {"January" => 1, "February" => 2, "March" => 3, "April" => 4, "May" => 5, "June" => 6, "July" => 7, "August" => 8, "September" => 9, "October" => 10, "November" => 11, "December" => 12}
    return months
  end

  def year
    now = Time.now.year.to_i
    year = {}
    for n in 0..4
      for_now = now+n
      year[for_now] = for_now
    end
    return year
  end

  def day
    days = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]
  end
end
