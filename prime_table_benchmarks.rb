$LOAD_PATH << '.'
require 'my_primes'
require 'benchmark'
include MyPrimes

nums = [1000,5000,100000,500000,1000000]
results = []
nums.each do |num|
	result = []
	result.push(Benchmark.measure {
		find_primes(num, :slow)
	}.real)
	result.push(Benchmark.measure {
		find_primes(num, :fast)
	}.real)
	results.push(result)
	puts "\nFor calculating the first #{num} prime numbers,\n\t\"slow\" algorithm took:\t#{result[0]}s\n\t\"fast\" algorithm took:\t#{result[1]}s"
end