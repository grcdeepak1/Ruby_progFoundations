require 'pry'
def say(msg)
  puts "=> #{msg}"
end

say('Welcome to the Calculator App')

def number?(num)
  num.to_i != 0
end

def operation_msg(operator)
  case operator
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

loop do
  num1 = ''
  loop do
    say "What's the first number?"
    num1 = gets.chomp
    break if number?(num1)
    say("Hmm.. That doesn't look like a valid number")
  end
  num2 = ''
  loop do
    say "What's the second number?"
    num2 = gets.chomp
    break if number?(num1)
    say("Hmm.. That doesn't look like a valid number")
  end

  operator_prompt = <<-MSG
    What operation would you like to perform
    1) Add
    2) Subtract
    3) Multiply
    4) Divide
  MSG
  operator = ''
  say(operator_prompt)
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    say('Please enter 1, 2, 3 or 4')
  end

  puts "#{operation_msg(operator)} the 2 Numbers : #{num1} #{num2}"
  result =  case operator
            when '1'
              num1.to_i + num2.to_i
            when '2'
              num1.to_i - num2.to_i
            when '3'
              num1.to_i * num2.to_i
            when '4'
              num1.to_f / num2.to_f
            else
              0
            end
  puts "Result #{result}"

  say('Do you want to perform another calculation ? (y/n)')
  break unless gets.chomp.downcase.start_with?('y')
end
