# frozen_string_literal: true

require '../problem_base'

# https://projecteuler.net/problem=1
class ProblemTwoRecursive < ProblemBase
  # def self.result
    
  # end
end

describe ProblemTwoRecursive, '.result' do
  it 'returns 4613732' do
    expect(ProblemTwoRecursive.result).to eq(4613732)
  end
end