class RubyNumeralsController < ApplicationController
  def index
  end

  def number_to_text(number, text)
    if number >= 1000000000
      text = "number is too big"
      return text
    elsif number >= 1000000 and number < 1000000000
      divisor = 1000000
      suffix  = "million"
    elsif number >= 1000
      divisor = 1000
      suffix  = "thousand"
    elsif number >= 100
      divisor = 100
      suffix  = "hundred"
    else
      result = 0
      if number >= 20
        result = number/10
        switch result
          case 2: text += "twenty"
          case 3: text += "thirty"
          case 4: text += "fourty"
          case 5: text += "fifty"
          case 6: text += "sixty"
          case 7: text += "seventy"
          case 8: text += "eighty"
          case 9: text += "ninety"
        end
        number = number % 10
      end

      if result != 0 and number != 0
        text += "-";

        switch number
          case 1: text += "one"
          case 2: text += "two"
          case 3: text += "three"
          case 4: text += "four"
          case 5: text += "five"
          case 6: text += "six"
          case 7: text += "seven"
          case 8: text += "eight"
          case 9: text += "nine"
          case 10: text += "ten"
          case 11: text += "eleven"
          case 12: text += "twelve"
          case 13: text += "thirteen"
          case 14: text += "fourteen"
          case 15: text += "fifteen"
          case 16: text += "sixteen"
          case 17: text += "seventeen"
          case 18: text += "eighteen"
          case 19: text += "nineteen"
        end
      end
    end

    text = number_to_text(number/divisor, text) + suffix

    if number > 100  
      text = number_to_text(number % divisor, text)

    return text
  end
end
