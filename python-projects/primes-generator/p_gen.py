#!/usr/bin/env python

def primesGen(max):
    primes = []
    l = 3

    # Lista nieparzystych aż do max
    while l <= max:
        if  (l % 2 == 1):  
            primes.append(l)
        l += 1

    # import pdb; pdb.set_trace()   

    # Odsiewamy te z dzielnikiem
    for i in primes:
        if i > 3:
            for j in primes:
                if (i > j) and (i % j == 0):
                    primes.remove(i)
                    break

    # Z jakiś dziwnych powodów jeszcze raz musimy odsiać
    for i in primes:
        if i > 3:
            for j in primes:
                if (i > j) and (i % j == 0):
                    primes.remove(i)
                    break

    # Dodajemy do począku listy
    primes.insert(0,2)
    primes.insert(0,1)
    print(primes)
        


inp = int(input("Podaj zakres: "))
primesGen(inp)


