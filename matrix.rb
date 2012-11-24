#encoding: utf-8
class SquareMatrix
  require 'mathn'
  ARRAY_LENGTH_SHIFT = 1
  attr_accessor :matrix, :cur_row, :cur_col, :cur_val

  def initialize(dementions)
    @matrix = []
    for row in 0..dementions-ARRAY_LENGTH_SHIFT
      new_row = Array.new(dementions)
      new_row.fill(0)
      @matrix << new_row
    end
    
    @cur_row = 0
    @cur_col = -1
    @cur_val = 1
  end

  def fill_matrix
    turn('right')
  end

  def print_matrix
    for row in 0..self.matrix.length-1
      for col in 0..self.matrix.length-1
        print "#{self.matrix[row][col]} "
      end
      puts
    end  
  end

private
  def go_right
    # идем по строке направо
    row = self.cur_row
    (self.cur_col+1).upto(self.matrix.length-ARRAY_LENGTH_SHIFT) do |col|
      # проверяем доступность элемента
      if element_allow?(row, col)
        save_value_and_position(row, col)
      else
        break
      end
    end

    turn('down') unless filling_complete?
  end

  def go_down
    col= self.cur_col    
    (self.cur_row+1).upto(self.matrix.length-ARRAY_LENGTH_SHIFT) do |row|
      if element_allow?(row, col)
        save_value_and_position(row, col)
      else
        break
      end
    end

    turn('left') unless filling_complete?
  end

  def go_left
    row = self.cur_row
    (self.cur_col-1).downto(0) do |col|
      if element_allow?(row, col)
        save_value_and_position(row, col)
      else
        break
      end
    end

    turn('up') unless filling_complete?
  end

  def go_up
    col= self.cur_col    
    (self.cur_row-1).downto(0) do |row|
      if element_allow?(row, col)
        save_value_and_position(row, col)
      else
        break
      end
    end

    turn('right') unless filling_complete?
  end

  def turn direction
    case direction
      when 'up'
        go_up
      when 'down'
        go_down
      when 'left'
        go_left
      when 'right'
        go_right
      end
  end

  def save_value_and_position row, col
    self.matrix[row][col] = self.cur_val
    self.cur_row = row
    self.cur_col = col
    self.cur_val += 1
 end

  def element_allow? row, col
    self.matrix[row][col] == 0  
  end
  
  def filling_complete?
    self.cur_val == self.matrix.length*self.matrix.length + ARRAY_LENGTH_SHIFT
  end

end
