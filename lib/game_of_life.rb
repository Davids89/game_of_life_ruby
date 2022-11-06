# lib/string_calculator.rb
class GameOfLife
  class InvalidGenerationError < StandardError; end
  class LifeInEdges < StandardError; end
  def check_generation(generation)
    raise InvalidGenerationError if generation.size == 1

    next_generation = []
    generation.each_with_index do |row, row_index|
      raise LifeInEdges if row.first == true || row.last == true
    end
  end
end
