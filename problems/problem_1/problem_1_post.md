# Math and Ruby: Project Euler Problem 1

## Introduction

This is the first post that I am writing in a while, and it's mostly because I am starting to work through all the problems on [Project Euler](https://projecteuler.net/). They are hard problems, so it's good practice. It'll help me stay on top of my math and ruby.

This first problem is fun, but there aren't that many clever mathematical approaches for getting the result. But we do see some of the methods that we can use in ruby. 

## Problem Statement

The following problem was taken from [Project Euler](https://projecteuler.net/problem=1):

> If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
> Find the sum of all the multiples of 3 or 5 below 1000.

This is a great problem because it takes a classic problem (FizzBuzz) and adds an extra layer to it. Conveniently, it has a single integer result as opposed to an array of integers and strings.

## Breaking it down.

This problem is basically saying that we need to do a few things. First, we need to find all the numbers from 1-999 that are multiples of 3 or 5. Then, we need to sum all those numbers together. This is a pretty straightforward problem. Let's see what we can do.

## Some Math

There isn't a lot of cool math that we can use here, but there is a cool property for numbers that are multiples of three. For a given integer, if the sum of the digits are divisible by 3, the integer itself is also divisible by 3. 

## Attempt One: Iterative Approach

I remember the first time I looked at FizzBuzz, and the sort of approach that I took when I first started coding. It would have looked something like this.

```ruby
n = 1
sum = 0

while n < 1000
    if n % 3 == 0 || n % 5 == 0
        sum += n
    end

    n += 1
end

return sum
```

This is a pretty short method, but it certainly has room to improves. When we run this code, we get the following result: `233168`. Spoiler, this is the correct answer. But we can get it in a much more ruby way.

## Attempt Two: Declarative Approach

So the iterative method gets us the correct answer, but can we get there with less code? Yes. If take a more declarative approach and take advantage of ruby's array methods, we can write the following method.

```ruby
[*1...1000].select! { |n| (n % 3).zero? || (n % 5).zero? }.sum
```

This is doing a lot, so let's break it down. First we are using `*` and a range to create all the values that we need to look at, 1-999. Then we are creating new array by selecting all the values that are multiples of 3 or 5 from the original array. Finally, we find the sum of the newly created array to get our result. The result of this method is `233168`, which is the same as the above method. 

# Comparing Methods

Is either of these approaches better? From a stylistic and readability perspective, the second method is probably better, but you need to know how splats, ranges, and array methods work. 

But what about performance? When we benchmark the iterative approach, we get the result in 0.039 milliseconds. When we benchmark the declarative approach, we get our result in 0.106 milliseconds. So the iterative approach is a lot quicker. I would need to dive into the implementation details to see why, but my guess is that the declarative method is probably generating a lot of overhead, while the iterative method is just performing the calculations we need.

What is the fastest way we could achieve this result?
What is the most readable way we could get this result?
And finally, what is the best way?

You can checkout the source on [my GitHub](https://github.com/william-lawrence/math-and-ruby).
