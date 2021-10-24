# frozen_string_literal: true

require 'rspec/autorun'

# Class that generates nth fibonacci term and array of fibonacci numbers.
class Fibonacci
  attr_accessor :cache

  def initialize
    @cache = { 0 => 0, 1 => 1 }
  end

  def self.binets_formula(n)
    sqrt5 = Math.sqrt(5)

    ((((1 + sqrt5)**n) - ((1 - sqrt5)**n)) / ((2**n) * sqrt5)).round
  end

  def self.nth_term_recursive(n)
    return n if (0..1).include? n

    (nth_term_recursive(n - 1) + nth_term_recursive(n - 2))
  end

  def nth_term_iterative(n)
    return @cache[n] if @cache.keys.include?(n)

    while @cache.count <= n
      next_term = @cache[@cache.count - 1] + @cache[@cache.count - 2]

      next_key = @cache.count

      @cache.merge!(next_key => next_term)
    end

    @cache[n]
  end
end

describe Fibonacci, '.nth_term_recursive' do
  it 'returns the nth fibonacci number' do
    expect(Fibonacci.nth_term_recursive(0)).to eq(0)
    expect(Fibonacci.nth_term_recursive(1)).to eq(1)
    expect(Fibonacci.nth_term_recursive(2)).to eq(1)
    expect(Fibonacci.nth_term_recursive(3)).to eq(2)
    expect(Fibonacci.nth_term_recursive(10)).to eq(55)
  end
end

describe Fibonacci, '.nth_term_iterative' do
  fibonacci = Fibonacci.new

  it 'returns the nth fibonacci number' do
    expect(fibonacci.nth_term_iterative(0)).to eq(0)
    expect(fibonacci.nth_term_iterative(1)).to eq(1)
    expect(fibonacci.nth_term_iterative(2)).to eq(1)
    expect(fibonacci.nth_term_iterative(3)).to eq(2)
    expect(fibonacci.nth_term_iterative(10)).to eq(55)
  end
end

describe Fibonacci, '.binets_formula' do
  it 'returns the nth fibonacci term' do
    expect(Fibonacci.binets_formula(0)).to eq(0)
    expect(Fibonacci.binets_formula(1)).to eq(1)
    expect(Fibonacci.binets_formula(10)).to eq(55)
  end
end
