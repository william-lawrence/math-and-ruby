# frozen_string_literal: true

require '../problem_base'

# https://projecteuler.net/problem=2
class ProblemTwoDeclarative < ProblemBase
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
    puts "Binet's Formula is not accurate for n > 70" if n > 70

    sqrt5 = Math.sqrt(5)

    ((((1 + sqrt5)**n) - ((1 - sqrt5)**n)) / ((2**n) * sqrt5)).round
  end
end

describe ProblemTwoDeclarative, '.result' do
  it 'returns 4,613,732' do
    expect(ProblemTwoDeclarative.result).to eq(4_613_732)
  end
end

describe ProblemTwoDeclarative, '.benchmark' do
  it 'returns result in under .1 seconds' do
    expect(ProblemTwoDeclarative.benchmark).to be < 0.1
  end
end
