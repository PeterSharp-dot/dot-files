#!/usr/bin/env python

def primesGen(max):
    primes = []
    l = 3
    while l <= max:
        if  (l % 2 == 1):  
            primes.append(l)
        l += 1

    # import pdb; pdb.set_trace()   
    for i in primes:
        if i > 3:
            for j in primes:
                if (i > j) and (i % j == 0):
                    primes.remove(i)
                    break
    for i in primes:
        if i > 3:
            for j in primes:
                if (i > j) and (i % j == 0):
                    primes.remove(i)
                    break


    primes.insert(0,2)
    primes.insert(0,1)
    print(primes)
        


inp = int(input("Podaj zakres: "))
primesGen(inp)
