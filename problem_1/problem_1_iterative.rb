# frozen_string_literal: true

require 'benchmark'

class ProblemOneIterative
   class << self

    def result
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

    def benchmark
      Benchmark.measure { result }
    end

  end
end
