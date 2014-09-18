
def get_value
gets.chomp.to_i
end

def warn_user
alert_user "nope..try again"
end

def congratulate_user
alert_user  "yay! well done ;-0"

  end
  def alert_user(message)
    puts message

  end

  def incorrect_guess(value)
    value  !=2**4
end
puts "What is 2 to the forth power"

value = get_value

while incorrect_guess(value)
warn_user
value = get_value

end

congratulate_user