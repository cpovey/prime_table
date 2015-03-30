$LOAD_PATH << '.'
require 'my_primes' # my custom lib
require 'prime' # Ruby stdlib
include MyPrimes

describe MyPrimes do
	let(:nums) { [1,2,5,10,100,500,1000,10000] }

	describe '.find_primes' do
		it 'should return the right number of results' do
			nums.each do |num|
				expect(find_primes(num).length).to eq(num)
			end
		end

		it 'should return correct set of prime numbers, based on input argument' do
			# test the actual results against Ruby's built-in prime number library 
			nums.each do |num|
				expect(find_primes(num)).to eq(Prime.first num)
			end
		end
	end

	it '.prime?' do
		test_nums = []
		400.times {test_nums.push(rand(3..100000))}
		test_nums.concat(Prime.first 100)

		test_nums.each do |num|
			expect(prime?(num)).to eq(Prime.prime?(num))
		end
	end

	it '.print_table' do
		# test that 11 lines are printed when calculating for 10 primes
		num = 10
		allow(self).to receive(:puts).exactly(num+1).times
		print_table(find_primes(num))
	end
end
