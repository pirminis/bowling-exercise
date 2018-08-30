class ProcessScores
  def process(scores)
    counter = 0
    frames = []

    loop do
      if strike?(scores[counter])
        break if counter >= scores.size - 2
        frames.push scores[counter, 3]
        counter += 1
      else
        break if counter >= scores.size - 1
        frames.push scores[counter, spare?(scores[counter, 2]) ? 3 : 2]
        counter += 2
      end
    end

    frames.flatten.sum
  end

  private

  def strike?(score)
    score.to_i == 10
  end

  def spare?(scores)
    scores.compact.sum == 10
  end
end
