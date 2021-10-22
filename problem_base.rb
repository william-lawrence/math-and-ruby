# frozen_string_literal: true

require 'benchmark'
require 'rspec/autorun'

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