# prime_table
Simple tool to calculate the first n prime numbers, and print them out in multiplication table form. 

**Usage**:  
`prime_table.rb <N>`  
Where	<N> : Number of primes to include in multiplication table

**Complexity**  
I believe the time complexity for Alg. 1 below would be `O(k*sqrt(k))` where k is the value of the nth prime number (aka the largest prime number found, aka the last number tested for primality, aka the total number of numbers tested for primality). Ideally I'd like to determine the complexity based on n (the number of primes found) since that's what the user is inputting, but I'm not sure how to make that determination mathematically.  
Similarly, for Alg. 2 the time complexity would be something like: "`O(k*n)` where k is the same as above, and n is the number of primes less than or equal to k." Tehnically, the complexity is better than this in practice, since we still have a "square root shortcut" similar to Alg. 1, but in this case the shortcut is based off of the *value* of the *nth* prime, and I'm honestly not sure how to express that in terms of n or k.  
Finally, the space complexity would be linear with the number of primes desired (i.e. `O(n)`), since we're storing each prime we find in an array as we go.

## Running specs
prime_table uses RSpec for its tests, so you'll need to install the rspec gem (gem install rspec). Then, simply run the following command to run the set of spec tests:  
`rspec prime_table_spec.rb`

## Running benchmark script
I also wrote a benchmark tool for fun, since I implemented two slightly different algorithms for determining primality and wanted to see how the performance compared between the two. To run the benchmark tests, run the following command from the base directory:  
`ruby prime_table_benchmarks.rb`

### Alg. 1 (aka "slow" algorithm):
Our basic test consists of looking for a number x less than num (starting with 3) that divides evenly into num. If we find such an x, we return false. Otherwise, if we reach num without returning, we know num is prime. We also take a couple shortcuts to speed up the algorithm:  
Shortcuts:
- If num is even, it cannot be prime (since all even numbers are divisible by 2)
- We can stop looking after we get to sqrt(num) since this represents the largest possible x that will not simply be a repeat of an earlier combination of factors
- We only need to consider odd numbers for x, since odd numbers can't have an even factor (and at this point, we already know num has to be odd)

### Alg. 2 (aka "fast" algorithm):
This algorithm is based on the mathematical rule that every non-prime number is simply the product of one or more primes. Therefore, testing non-primes as factors is redundant, since this would be equivalant to trying the component primes multiple times (which is duplicate work). So instead, we only test whether a num is divisible by the primes we've found so far (which will be every prime less than num).

*Note on benchmarks*: Surprisingly, Alg. 2 is actually slower when calculating smaller numbers of primes (e.g. ~5000 or fewer). This is surprising, since Alg. 2 should reduce the number of iterations per test by a fair amount. However, when calculating very large sets of primes (e.g. on the order of 100,000), Alg. 2 is noticeably faster, as we would expect. My best guess is that this has to do with overhead associated with the array iteration (i.e. "#each" in Alg. 2 as compared to the basic while loop condition in Alg. 1) as well as the need to pass the array as a parameter in Alg. 2. 