module RecordsHelper

  # helper method for graphs
  def records_chart_data(location)
    (1.week.ago.to_date..Date.yesterday).map  do |date|
      {
        date: date,
        santa_cruz: Record.where(:location => "scz").where("date(date) = ?", date).count,
        north_bay: Record.where(:location => "nby").where("date(date) = ?", date).count,
        peninsula: Record.where(:location => "pen").where("date(date) = ?", date).count,
        east_bay: Record.where(:location => "eby").where("date(date) = ?", date).count,
        south_bay: Record.where(:location => "sby").where("date(date) = ?", date).count,
        san_francisco: Record.where(:location => "sfc").where("date(date) = ?", date).count
      }
    end
  end

  #this is to find the mean

  def records_by_day
      (Record.first.date..Date.today).map  do |date|
          Record.where("date(date) = ?", date).count
    end
  end

  def records_mean
    records_by_day.reduce(:+)/(Record.first.date..Date.today).count
  end
end