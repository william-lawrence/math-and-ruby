# frozen_string_literal: true

require '../problem_base'

# https://projecteuler.net/problem=2
class ProblemTwoIterative < ProblemBase
  MAX_VALUE = 4_000_000

  def self.result
    n = 0
    sum = 0

    while fibonacci(n) < MAX_VALUE
      sum += fibonacci(n) if fibonacci(n) % 2 == 0
      n += 1
    end

    sum
  end

  def self.fibonacci(n)
    fibonacci_terms = { 0 => 0, 1 => 1 }
    return fibonacci_terms[n] if fibonacci_terms.keys.include?(n)

    while fibonacci_terms.count <= n
      next_term = fibonacci_terms[fibonacci_terms.count - 1] + fibonacci_terms[fibonacci_terms.count - 2]
      next_key = fibonacci_terms.count

      fibonacci_terms.merge!(next_key => next_term)
    end

    fibonacci_terms[n]
  end
end

describe ProblemTwoIterative, '.result' do
  it 'returns 4,613,732' do
    expect(ProblemTwoIterative.result).to eq(4_613_732)
  end
end

describe ProblemTwoIterative, '.benchmark' do
  it 'returns result in under .5 seconds' do
    expect(ProblemTwoIterative.benchmark).to be < 0.5
  end
end
