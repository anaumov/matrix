require_relative 'matrix'
require 'mathn'

puts "Put square number"
while true
  STDOUT.flush  
  input_value = gets.chomp.to_i
  sqrt = Math.sqrt(input_value)
  if sqrt==sqrt.to_i
    break
  else
    puts "#{input_value} is not perfect square, try again \n" 
  end
end

dimentions = sqrt.to_i
matrix = SquareMatrix.new(dimentions)
matrix.fill_matrix
matrix.print_matrix
