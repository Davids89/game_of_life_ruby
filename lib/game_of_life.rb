# lib/string_calculator.rb
class GameOfLife
  class InvalidGenerationError < StandardError; end
  class LifeInEdges < StandardError; end
  def check_generation(generation)
    raise InvalidGenerationError if generation.size == 1

    next_generation = []
    generation.each_with_index do |row, row_index|
      raise LifeInEdges if row.first == true || row.last == true

      next_row_generation = Array.new(row.size, false)

      row.each_with_index do |cell, cell_index|
        alive_neighbours = check_alive_neighbours(generation, row_index, cell_index)

        unless alive?(cell)
          next_row_generation[cell_index] = true if alive_neighbours == 3
        end

        if alive?(cell) && alive_neighbours == 2 || alive_neighbours == 3
          next_row_generation[cell_index] = true
        end
      end

      next_generation.push(next_row_generation)
    end

    next_generation
  end

  private

  def check_alive_neighbours(generation, row_number, cell_index)
    alive_neighbours = 0

    alive_neighbours = alive_neighbours + check_left_neighbours(generation, row_number, cell_index)
    alive_neighbours = alive_neighbours + check_right_neighbours(generation, row_number, cell_index)
    alive_neighbours = alive_neighbours + check_up_neighbours(generation, row_number, cell_index)
    alive_neighbours = alive_neighbours + check_down_neighbours(generation, row_number, cell_index)

    alive_neighbours
  end

  def check_left_neighbours(generation, row_number, index)
    return 0 if index == 0

    generation[row_number][index - 1] ? 1 : 0
  end

  def check_right_neighbours(generation, row_number, cell_index)
    return 0 if cell_index == generation[row_number].size

    generation[row_number][cell_index + 1] ? 1 : 0
  end

  def check_up_neighbours(generation, row_number, cell_index)
    return 0 if row_number == 0

    generation[row_number - 1][cell_index] ? 1 : 0
  end

  def check_down_neighbours(generation, row_number, cell_index)
    return 0 if row_number == (generation.size - 1)

    generation[row_number + 1][cell_index] ? 1 : 0
  end

  def alive?(cell)
    cell
  end
end
