# spec/game_of_life_spec.rb

require_relative "../lib/game_of_life"

describe GameOfLife do
  describe '.check_iteration' do
    context 'when an invalid generation is passed' do
      it 'raise error' do
        generation = [true, false]

        expect do
          described_class.new.check_generation(generation: generation)
        end.to raise_error(described_class::InvalidGenerationError)
      end
    end
  end
end
