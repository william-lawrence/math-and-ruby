# Generating Fibonacci Numbers

## Introduction

This is going to be a little interlude between the the Project Euler problems because the next problem has to do with Fibonacci numbers! 

The Fibonacci sequence is generated with two initial integers, usually 0 and 1, and then adding those two terms to create the next term in the sequence. The sequence continues to infinity by adding the two previous terms in the sequence. They come up in the Project Euler problems pretty frequently because they are mathematically interesting and present some performance issues when generating them.

This post is going to talk about a three ways to generate Fibonacci numbers, and what the different tradeoffs 

## Method 1: Recursion

Because of the way the Fibonacci sequence is defined, it lends itself to being generated with a recursive function. Lets take a look:

```ruby
def nth_term_recursive(n)
    return n if (0..1).include?(n)

    (nth_term_recursive(n - 1) + nth_term_recursive(n - 2))
end
```

We have our base cases, 0 and 1, the first two terms of the sequence. After that, we keep calling the method until we get to the base case, and then we roll up to the actual value of the term in the sequence that we wanted. This works, and it's a classic.

However, as we get more into the project Euler problems, we are going to run into some issues with performance. This method runs in `O(2^n)` time, which is fine for small values, but is really slow when it comes to large values, say the 10,000th term in the sequence.

## Method 2: Iteration

Using iteration and holding the values in memory, we can speed up the method. Let's take a look.

```ruby
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
```

This method will yield the same results. We start with our base case, and then generate a hash where the key is the index of the term in the sequence, and the value is the value of the term. By using a hash, we can store the terms of the sequence that are needed to generate the term that we want. This gives us a method that operates in `O(n)` time, which is a big improvement. If we want, we could even memoize the results so that we could find terms that were already calculated.

## Method 3: Binet's Formula

There is actually a way to directly calculate the terms in the Fibonacci sequence, but there is a problem. It can only be used in limited cases (at least on a computer). We can use [Binet's Formula](https://mathworld.wolfram.com/BinetsFibonacciNumberFormula.html). However, because of the rounding errors that occur when we take square roots, this method breaks down. Let's take a look:

```ruby
def binets_formula
  puts "Binet's Formula is not accurate for n > 70" if n > 70

  sqrt5 = Math.sqrt(5)

  ((((1 + sqrt5)**n) - ((1 - sqrt5)**n)) / ((2**n) * sqrt5)).round
end
```

We can see that I output a string when we are looking at the terms greater than 70. Lets compare what happen when we use Binet's Formula against our iterative method for the 70th and 71st terms of the Fibonacci sequence.

```
irb(main):001:0> Fibonacci.nth_term(70)
=> 190392490709135
irb(main):002:0> Fibonacci.binets_formula(70)
=> 190392490709135
irb(main):003:0> Fibonacci.nth_term(71)
=> 308061521170129
irb(main):004:0> Fibonacci.binets_formula(71)
Binet's Formula is not accurate for n > 70
=> 308061521170130
```

As you can see, we start getting drift between the results, and the result from Binet's formula is no longer accurate.
However, for the terms that are accurate, we can get them in constant time, so that's cool. 

## Conclusion

For problems that use the Fibonacci sequence, I will likely use the iterative approach since that has a good balance between speed and accuracy, but something tells me that there are even more complex ways to get large Fibonacci numbers in a faster time than `O(n)`.

You can checkout the source code for this post [on my Github](https://github.com/william-lawrence/math-and-ruby/blob/main/helpers/fibonacci.rb).
