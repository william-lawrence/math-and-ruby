# frozen_string_literal: true

require '../problem_base'

class ProblemOneIterative < ProblemBase

  def self.result
    n = 1
    sum = 0

    while n < 1000
      if n % 3 == 0 || n % 5 ==0
        sum += n
      end

      n += 1
    end

    return sum
  end

end

describe ProblemOneIterative, '.result' do
  it 'returns 233168' do
    expect(ProblemOneIterative.result).to eq(233168)
  end
end

describe ProblemOneIterative, '.benchmark' do
  it 'reports result in < 1 second' do
    expect(ProblemOneIterative.benchmark).to be < 1
  end
end
