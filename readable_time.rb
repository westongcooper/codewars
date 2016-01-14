require_relative '../framework'

def format_duration(seconds)
  minute = 60
  hour = minute**2
  day = hour*24
  year = day*365
  format = ""
  time = []
  time << "#{seconds / year} year" + (seconds / year > 1 ? "s" : "") if seconds >= year
  time << "#{seconds / day % 365} day" + (seconds / day % 365> 1 ? "s" : "") if seconds >= day && seconds / day % 365 != 0
  time << "#{seconds / hour % 24} hour" + (seconds / hour % 24> 1 ? "s" : "") if seconds >= hour && seconds / hour % 24 != 0
  time << "#{seconds / minute % 60} minute" + (seconds / minute % 60 > 1 ? "s" : "") if seconds >= minute && seconds / minute % 60 != 0
  time << "#{seconds % 60} second" + (seconds % 60 > 1 ? "s" : "") if seconds > 0 && seconds % 60 != 0
  time.each_with_index do |t,i|
    format << t
    return format if i == time.length - 1
    format << (i == time.length - 2 ? " and " : ", ")
  end
end

Test.assert_equals(format_duration(1), "1 second")
Test.assert_equals(format_duration(62), "1 minute and 2 seconds")
Test.assert_equals(format_duration(120), "2 minutes")
Test.assert_equals(format_duration(3600), "1 hour")
Test.assert_equals(format_duration(3662), "1 hour, 1 minute and 2 seconds")