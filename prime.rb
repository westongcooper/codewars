def prime(max)
  primes = []
    (2..max).each {|num|
        if
            (2..num-1).all? {|denom| num%denom >0}
        then
            primes.push(num)
        end
    }
    print primes
end

prime 100