require 'rspec'
require_relative 'process_scores'

RSpec.describe ProcessScores do
  describe '#process' do
    it 'returns score of 300 when fully lucky' do
      scores = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10] # 300

      expect(described_class.new.process(scores)).to eq 300
    end

    it 'returns score of 36' do
      scores = [10, 5, 1, 9, 1, 4] # (10 + 5 + 1) + (5 + 1) + (9 + 1 + 4) = 36

      expect(described_class.new.process(scores)).to eq 36
    end

    it 'returns score of 57' do
      scores = [10, 10, 9, 0] # (10 + 10 + 9) + (10 + 9 + 0) + (9 + 0) = 57

      expect(described_class.new.process(scores)).to eq 57
    end

    it 'returns score of 105' do
      scores = [10, 10, 10, 8, 2, 8, 1] # (10 + 10 + 10) + (10 + 10 + 8) + (10 + 8 + 2) + (8 + 2 + 8) + (8 + 1) =

      expect(described_class.new.process(scores)).to eq 105
    end

    it 'returns score of 145' do
      scores = [10, 10, 10, 10, 10, 7, 2] # 90 + (10 + 10 + 7) + (10 + 7 + 2) + (7 + 2) = 145

      expect(described_class.new.process(scores)).to eq 145
    end

    it 'returns score of 20' do
      scores = [7, 3, 4, 2] # (7 + 3 + 4) + (4 + 2) = 20

      expect(described_class.new.process(scores)).to eq 20
    end

    it 'returns score of 133' do
      scores = [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] # (1 + 4) + (4 + 5) + (6 + 4 + 5) + (5 + 5 + 10) + (10 + 0 + 1) + (0 + 1) + (7 + 3 + 6) + (6 + 4 + 10) + (10 + 2 + 8) + (2 + 8 + 6) = 133

      expect(described_class.new.process(scores)).to eq 133
    end

    it 'returns score of 0 when fully unlucky' do
      scores = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] # 0

      expect(described_class.new.process(scores)).to eq 0
    end

    it 'return score of 28' do
      scores = [10, 3, 6] # (10 + 3 + 6) + (3 + 6) = 28

      expect(described_class.new.process(scores)).to eq 28
    end
  end
end
