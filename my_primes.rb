module MyPrimes
	def find_primes(n, alg = :fast)
		primes = [2] # initialize to the first prime, 2
		i = 3 # we'll start our search for the next prime at 3
		while primes.length < n
			if (alg == :fast) ? faster_prime?(i, primes) : prime?(i)
				primes.push(i)
			end
			i += 1
		end
		primes
	end

	# Our basic test consists of looking for a number x less than num (starting with 3) that divides evenly into num. If we find such an x, we return false.
	# Shortcuts:
	# 	 - If num is even, it cannot be prime (since all even numbers are divisible by 2)
	#    - We can stop looking after we get to sqrt(num) since this represents the largest possible x that will not simply be a repeat of
	#      an earlier combination of factors 
	# 	 - We only need to consider odd numbers for x, since odd numbers can't have an even factor (and at this point, we already know num has to be odd)
	def prime?(num)
		if num != 2 and num % 2 == 0
			return false # all primes (other than 2!) are odd numbers (since all evens divide evenly by 2)
		else # our test will consist of looking for a number less than n (starting with 3) that divides evenly into n
			i = 3
			while i*i <= num # stop after we get to sqrt(i)
				return false if num % i == 0
				i += 2 # skip even factors
			end
			return true
		end
	end

	# Another algorithm, based on the rule that every non-prime is simply the product of one or more primes. Therefore, testing non-primes 
	# as factors is redundant, since this is equivalant to trying the component primes multiple times (duplicate work). So instead, we only test
	# whether a num is divisible by the primes we've found so far (which will be every prime less than num)
	def faster_prime?(num, primes)
		if num != 2 and num % 2 == 0
			return false
		else
			primes.each do |p|
				break if p*p > num # we can still stop looking once we get to sqrt(num)
				return false if num % p == 0
			end
			return true
		end
	end

	def print_table(primes)
		cell_size = (primes[primes.length-1]**2).to_s.length + 2
		row = "|" + "|".rjust(cell_size+1) # top-left empty cell
		primes.each do |p| # base row
			row = row + "*#{p}*".to_s.rjust(cell_size) + "|"
		end
		puts row

		primes.each do |p|
			row = "|" + "*#{p}*".to_s.rjust(cell_size) + "|"
			primes.each do |q|
				row = row + "#{p*q} ".to_s.rjust(cell_size) + "|"
			end
			puts row
		end
	end
end