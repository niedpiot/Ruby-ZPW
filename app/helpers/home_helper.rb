module HomeHelper
  def formatted_time(time)
    time.strftime("%I:%M%p") # time string in AM/PM format end
  end
end
