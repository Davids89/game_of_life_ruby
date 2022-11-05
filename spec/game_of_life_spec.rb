# spec/game_of_life_spec.rb

require_relative "../lib/game_of_life"

describe GameOfLife do
  describe '.check_iteration' do
    context 'when an invalid generation is passed' do
      it 'raise error' do
        generation = [true, false]

        expect do
          described_class.new.check_generation(generation)
        end.to raise_error(described_class::InvalidGenerationError)
      end
    end

    context 'when there is life in the edge' do
      it 'raise error' do
        first_row = [false, true, false]
        second_row = [true, false, false]

        expect do
          described_class.new.check_generation(first_row, second_row)
        end.to raise_error(described_class::LifeInEdges)
      end
    end
  end
end
