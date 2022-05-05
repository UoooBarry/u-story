module HomeHelper
  MEETING_DAY = [2022, 02, 07]

  def days_distances
    meeting_day = Date.new(*MEETING_DAY)

    Date.today.mjd - meeting_day.mjd
  end
end
