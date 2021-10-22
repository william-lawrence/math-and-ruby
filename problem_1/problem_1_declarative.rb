# frozen_string_literal: true

require 'benchmark'

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
