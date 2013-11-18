class RubyNumeralsController < ApplicationController
  def index
    text = ""
    num_str = params[:number]

    if num_str != nil and num_str =~ /^-?[0-9]+$/
      number = num_str.to_i
      @text = number_to_text(number, text)
      words = @text.split(' ')

      if words.count > 1 and words[-1] != "big"
        words[-1] = "and " + words[-1]
      end

      @text = words.join(' ')
    else
      @text = "Please enter a number"
    end
  end

  def number_to_text(number, text)
    if text == nil
      text = ""
    end

    if number < 0
      text = "minus "
      number = 0 - number
    end

    divisor = 1

    if number >= 1000000000
      text = "number is too big"
      return text
    elsif number >= 1000000 and number < 1000000000
      divisor = 1000000
      suffix  = " million"
    elsif number >= 1000
      divisor = 1000
      suffix  = " thousand"
    elsif number >= 100
      divisor = 100
      suffix  = " hundred"
    else
      result = 0
      if number >= 20
        result = number/10
        case result
          when 2 
            text += " twenty"
          when 3 
            text += " thirty"
          when 4 
            text += " fourty"
          when 5 
            text += " fifty"
          when 6 
            text += " sixty"
          when 7 
            text += " seventy"
          when 8 
            text += " eighty"
          when 9 
            text += " ninety"
        end
        number = number % 10
      end

      if result != 0 and number != 0
        text += "-"
      else
        text += " "
      end

      case number
      when 0
        text = "zero"
      when 1 
        text += "one"
      when 2 
        text += "two"
      when 3 
        text += "three"
      when 4 
        text += "four"
      when 5 
        text += "five"
      when 6 
        text += "six"
      when 7 
        text += "seven"
      when 8 
        text += "eight"
      when 9 
        text += "nine"
      when 10 
        text += "ten"
      when 11 
        text += "eleven"
      when 12 
        text += "twelve"
      when 13 
        text += "thirteen"
      when 14 
        text += "fourteen"
      when 15 
        text += "fifteen"
      when 16 
        text += "sixteen"
      when 17 
        text += "seventeen"
      when 18 
        text += "eighteen"
      when 19 
        text += "nineteen"
      end
    end

    if number >= 100  
      text = number_to_text(number/divisor, text) + suffix
      if number % divisor > 0
        text = number_to_text(number % divisor, text)
      end
    end

    return text
  end
end
