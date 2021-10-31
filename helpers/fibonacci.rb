# frozen_string_literal: true

require 'rspec/autorun'

# Class that generates nth fibonacci term and array of fibonacci numbers.
class Fibonacci
  attr_accessor :cache

  def initialize
    @cache = { 0 => 0, 1 => 1 }
  end

  def nth_term(n)
    return @cache[n] if @cache.keys.include?(n)

    while @cache.count <= n
      next_term = @cache[@cache.count - 1] + @cache[@cache.count - 2]
      next_key = @cache.count

      @cache.merge!(next_key => next_term)
    end

    @cache[n]
  end

  class << self
    def binets_formula(n)
      return "Binet's Formula is not accurate for n > 70" if n > 70

      sqrt5 = Math.sqrt(5)

      ((((1 + sqrt5)**n) - ((1 - sqrt5)**n)) / ((2**n) * sqrt5)).round
    end

    def nth_term(n)
      fibonacci_terms = { 0 => 0, 1 => 1 }
      return fibonacci_terms[n] if fibonacci_terms.keys.include?(n)

      while fibonacci_terms.count <= n
        next_term = fibonacci_terms[fibonacci_terms.count - 1] + fibonacci_terms[fibonacci_terms.count - 2]
        next_key = fibonacci_terms.count

        fibonacci_terms.merge!(next_key => next_term)
      end

      fibonacci_terms[n]
    end

    def nth_term_recursive(n)
      return n if (0..1).include?(n)

      (nth_term_recursive(n - 1) + nth_term_recursive(n - 2))
    end
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

describe Fibonacci, '.nth_term' do
  it 'returns the nth fibonacci number' do
    expect(Fibonacci.nth_term(0)).to eq(0)
    expect(Fibonacci.nth_term(1)).to eq(1)
    expect(Fibonacci.nth_term(2)).to eq(1)
    expect(Fibonacci.nth_term(3)).to eq(2)
    expect(Fibonacci.nth_term(10)).to eq(55)
    expect(Fibonacci.nth_term(300)).to eq(222_232_244_629_420_445_529_739_893_461_909_967_206_666_939_096_499_764_990_979_600)
  end
end

describe Fibonacci, '#nth_term' do
  fibonacci = Fibonacci.new

  it 'returns the nth fibonacci number' do
    expect(fibonacci.nth_term(0)).to eq(0)
    expect(fibonacci.nth_term(1)).to eq(1)
    expect(fibonacci.nth_term(2)).to eq(1)
    expect(fibonacci.nth_term(3)).to eq(2)
    expect(fibonacci.nth_term(10)).to eq(55)
    expect(fibonacci.nth_term(300)).to eq(222_232_244_629_420_445_529_739_893_461_909_967_206_666_939_096_499_764_990_979_600)
  end
end

describe Fibonacci, '.binets_formula' do
  it 'returns the nth fibonacci term' do
    expect(Fibonacci.binets_formula(0)).to eq(0)
    expect(Fibonacci.binets_formula(1)).to eq(1)
    expect(Fibonacci.binets_formula(10)).to eq(55)
    expect(Fibonacci.binets_formula(71)).to eq("Binet's Formula is not accurate for n > 70")
  end

  it 'returns different values for binet and iterative results when n = 70' do
    expect(Fibonacci.binets_formula(70)).to eq(Fibonacci.nth_term(70))
  end
end
