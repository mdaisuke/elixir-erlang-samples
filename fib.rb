def fib(n)
  return n if n <= 1
  fib(n-1) + fib(n-2)
end

(35..40).each do |i|
  puts(fib(i))
end
# 26.54 real        26.24 user         0.10 sys
