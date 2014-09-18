class Bob

  def hey(value)
    case
    when value == value.upcase
      'Woah, chill out!'
    when value.end_with?("?")
      'Sure.'
    else
       "Whatever."
    end
  end
end