$LOAD_PATH << '.'
require 'my_primes'
include MyPrimes

# validate command line args
usage = "\nUsage:\n\tprime_mult_table.rb <N>\nWhere\t<N> : Number of primes to include in multiplication table"
if ARGV.length != 1 
	puts "Invalid number of arguments.#{usage}"
elsif not ARGV[0].match(/^\d+$/)
	puts "Invalid argument. <N> must be a positive integer.#{usage}"
end
exit if ARGV[0].to_i < 1 # exit unles we want at least one prime

print_table(find_primes(ARGV[0].to_i))