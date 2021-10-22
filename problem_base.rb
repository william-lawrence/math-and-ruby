# frozen_string_literal: true

require 'benchmark'
require 'rspec/autorun'

# Base class used for each problem. Gives us benchmarking for free.
class ProblemBase
  class << self
    def result
      raise NotImplementedError
    end

    def benchmark
      Benchmark.measure { result }.total
    end
  end

end