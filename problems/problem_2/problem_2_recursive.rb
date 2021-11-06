# frozen_string_literal: true

require '../problem_base'

# https://projecteuler.net/problem=2
class ProblemTwoRecursive < ProblemBase
  MAX_VALUE = 4_000_000

  def self.result
    n = 0
    sum = 0

    while fibonacci(n) < MAX_VALUE
      sum += fibonacci(n) if fibonacci(n).even?
      n += 1
    end

    sum
  end

  def self.fibonacci(n)
    return n if (0..1).include?(n)

    (fibonacci(n - 1) + fibonacci(n - 2))
  end
end

describe ProblemTwoRecursive, '.result' do
  it 'returns 4,613,732' do
    expect(ProblemTwoRecursive.result).to eq(4_613_732)
  end
end

describe ProblemTwoRecursive, '.benchmark' do
  it 'returns 4,613,732' do
    expect(ProblemTwoRecursive.benchmark).to be < 10
  end
end
