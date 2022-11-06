# spec/game_of_life_spec.rb

require_relative "../lib/game_of_life"

describe GameOfLife do
  describe '.check_iteration' do
    context 'when an invalid generation is passed' do
      it 'raise error' do
        generation = [[true, false]]

        expect do
          described_class.new.check_generation(generation)
        end.to raise_error(described_class::InvalidGenerationError)
      end
    end

    context 'when there is life in the edge' do
      it 'raise error' do
        generation = [
          [false, true, false],
          [true, false, false]
        ]

        expect do
          described_class.new.check_generation(generation)
        end.to raise_error(described_class::LifeInEdges)
      end
    end

    context 'when a cell has no two alive neighbours' do
      it 'dies irremediably' do
        initial_generation = [
          [false, false, false],
          [false, true, false],
          [false, false, false]
        ]

        expected_next_generation = [
          [false, false, false],
          [false, false, false],
          [false, false, false]
        ]

        next_generation = described_class.new.check_generation(initial_generation)

        expect(next_generation).to eq(expected_next_generation)
      end
    end

    context 'when an alive cell has 2 neighbours alive' do
      it 'goes to the next generation' do
        initial_generation = [
          [false, true, false],
          [false, true, false],
          [false, true, false]
        ]

        expected_next_generation = [
          [false, false, false],
          [false, true, false],
          [false, false, false]
        ]

        next_generation = described_class.new.check_generation(initial_generation)

        expect(next_generation).to eq(expected_next_generation)
      end
    end

    context 'when an alive cell has 3 neighbours alive' do
      it 'goes to the next generation' do
        initial_generation = [
          [false, true, false, false],
          [false, true, true, false],
          [false, true, false, false]
        ]

        expected_next_generation = [
          [false, false, false, false],
          [false, true, false, false],
          [false, false, false, false]
        ]

        next_generation = described_class.new.check_generation(initial_generation)

        expect(next_generation).to eq(expected_next_generation)
      end
    end
  end
end
