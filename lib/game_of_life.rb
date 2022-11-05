# lib/string_calculator.rb
class GameOfLife
  class InvalidGenerationError < StandardError; end
  class LifeInEdges < StandardError; end
  def check_generation(*rows)
    raise InvalidGenerationError if rows.size == 1
  end
end
