# frozen_string_literal: true

require 'rspec/autorun'

# Class that generates nth fibonacci term and array of fibonacci numbers.
class Fibonacci
  class << self
    def array(n)
      fibonacci_array = Array.new

      [*0..n].each { |i| fibonacci_array << nth_term_recursive(i) }

      fibonacci_array
    end

    def binets_formula(n)
      sqrt5 = Math.sqrt(5)

      ((((1 + sqrt5)**n) - ((1 - sqrt5)**n)) / ((2**n) * sqrt5)).round
    end

    def nth_term_recursive(n)
      return n if (0..1).include? n

      (nth_term_recursive(n - 1) + nth_term_recursive(n - 2))
    end

    def nth_term_iterative
      
    end
  end
end

describe Fibonacci, '.nth_term_recursive' do
  it 'returns the nth fibonacci number' do
    expect(Fibonacci.nth_term_recursive(0)).to eq(0)
    expect(Fibonacci.nth_term_recursive(1)).to eq(1)
    expect(Fibonacci.nth_term_recursive(10)).to eq(55)
  end
end

describe Fibonacci, '.nth_term_iterative' do
  it 'returns the nth fibonacci number' do
    expect(Fibonacci.nth_term_recursive(0)).to eq(0)
    expect(Fibonacci.nth_term_recursive(1)).to eq(1)
    expect(Fibonacci.nth_term_recursive(10)).to eq(55)
  end
end

describe Fibonacci, '.binets_formula' do
  it 'returns the nth fibonacci term' do
    expect(Fibonacci.binets_formula(0)).to eq(0)
    expect(Fibonacci.binets_formula(1)).to eq(1)
    expect(Fibonacci.binets_formula(10)).to eq(55)
  end
end

describe Fibonacci, '.array' do
  it 'returns an array of fibonacci numbers up to the nth term' do
    expect(Fibonacci.array(10)).to eq([0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
  end
end
