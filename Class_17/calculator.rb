#!/usr/bin/env ruby

class Calculator
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    raise ArgumentError, "Cannot divide by zero" if b == 0
    a.to_f / b
  end

  def calculate(num1, operator, num2)
    case operator
    when '+'
      add(num1, num2)
    when '-'
      subtract(num1, num2)
    when '*'
      multiply(num1, num2)
    when '/'
      divide(num1, num2)
    else
      raise ArgumentError, "Invalid operator: #{operator}"
    end
  end
end

def get_number(prompt)
  print prompt
  input = gets.chomp
  Float(input)
rescue ArgumentError
  puts "Invalid number. Please enter a valid number."
  get_number(prompt)
end

def get_operator
  print "Enter operator (+, -, *, /): "
  operator = gets.chomp
  unless ['+', '-', '*', '/'].include?(operator)
    puts "Invalid operator. Please use +, -, *, or /"
    return get_operator
  end
  operator
end

def main
  calculator = Calculator.new

  puts "=" * 40
  puts "       RUBY CALCULATOR"
  puts "=" * 40
  puts "Perform basic arithmetic operations"
  puts "Type 'exit' or 'quit' to close"
  puts "=" * 40
  puts

  loop do
    print "Enter first number (or 'exit' to quit): "
    input = gets.chomp.downcase

    break if ['exit', 'quit', 'q'].include?(input)

    begin
      num1 = Float(input)
    rescue ArgumentError
      puts "Invalid number. Please try again.\n\n"
      next
    end

    operator = get_operator

    num2 = get_number("Enter second number: ")

    begin
      result = calculator.calculate(num1, operator, num2)
      puts "\n>>> Result: #{num1} #{operator} #{num2} = #{result}\n\n"
    rescue ArgumentError => e
      puts "\nError: #{e.message}\n\n"
    end
  end

  puts "\nThank you for using Ruby Calculator!"
end

main
