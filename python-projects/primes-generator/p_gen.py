#!/usr/bin/env python

def primesGen(max):
    primes = [3]
    l = 4
    # import pdb; pdb.set_trace()   
    while l <= max:
        if (l % 2 == 1):  # gdy l jest nieparzyste
            primes.append(l)
        else: 
            l += 1

        for i in primes:
            if ( l % 2 == 1 and l % i == 0 and i != l):  # jeśli to nieparzysta i dzielona przez liczbę, która jest różna od l 
                l += 1
                break
            else:
                l += 1


    primes.insert(0,2)
    primes.insert(0,1)
    # print(set(primes))
    print(primes)
        


inp = int(input("Podaj zakres: "))
primesGen(inp)
