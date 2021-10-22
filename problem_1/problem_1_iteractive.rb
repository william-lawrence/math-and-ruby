n = 0
sum = 0

while n < 1000 do
    sum += n if n % 3 == 0 || n % 5 == 0
    n += 1
end

puts sum