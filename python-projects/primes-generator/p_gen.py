#!/usr/bin/env python

def primesGen(max):
    primes = [3]
    l = 3
    # import pdb; pdb.set_trace()   
    while l <= max:
        for i in primes:
            if (l % 2 == 1 and l % i == 0 and l == i):
                     primes.append(l)
                     l += 1
            else: 
                l += 1
                primes.append(l)

        # for i in primes:
            # if ( l % 2 == 1 and l % i == 0 and i != l):  
                # primes.append(l)



    primes.insert(0,2)
    primes.insert(0,1)
    # print(set(primes))
    print(primes)
        


inp = int(input("Podaj zakres: "))
primesGen(inp)
