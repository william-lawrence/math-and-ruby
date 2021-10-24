# frozen_string_literal: true

require '../problem_base'

# https://projecteuler.net/problem=1
class ProblemOneDeclarative < ProblemBase
  def self.result
    [*1...1000].select! { |n| (n % 3).zero? || (n % 5).zero? }.sum
  end
end

describe ProblemOneDeclarative, '.result' do
  it 'returns 233168' do
    expect(ProblemOneDeclarative.result).to eq(233_168)
  end
end

describe ProblemOneDeclarative, '.benchmark' do
  it 'reports the result in < 1 second' do
    expect(ProblemOneDeclarative.benchmark).to be < 1
  end
end
