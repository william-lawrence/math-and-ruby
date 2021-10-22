# Math And Ruby

## Introduction

I decided that I am going to tackle all of the project euler problems. One, it's going to make sure I don't forget my math. Two it's going to make sure I stay up to date on my ruby.

## Running a solution

Each of the solutions will have a few attempts, as well as a file that takes a look at how we solved each problem. In order to run one of the files, you are going to need to load it into irb. 

1. Clone the repo
2. Navigate to the problem that you want to look at.
3. Run the following command: `irb -r <problem_file.rb>`

From there, you can run `ProblemClass.result` to get the result and `ProblemClass.benchmark` to get the benchmarks.

Example:
```
$ irb -r ./problem_1_declarative.rb
irb(main):001:0> ProblemOneDeclarative.result
=> 233168
irb(main):002:0> ProblemOneDeclarative.benchmark
=> 0.00010199999999997711
```