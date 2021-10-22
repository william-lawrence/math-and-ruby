# frozen_string_literal: true

require 'benchmark'
require 'rspec/autorun'

# https://projecteuler.net/problem=1
class ProblemOneDeclarative
  class << self
    def result
      [*1...1000].select! { |n| (n % 3).zero? || (n % 5).zero? }.sum
    end

    def benchmark
      Benchmark.measure { result }.total
    end
  end
end

describe ProblemOneDeclarative, '.result' do
  it 'returns 233168' do
    expect(ProblemOneDeclarative.result).to eq(233_168)
  end
end
