#!/usr/bin/env python

def primesGen(max):
    l = 2
    while l <= max:
        for i in range(2,l):
            if ((l / i-1) != 1) or ((l / i-1) != l):
                break
            else:
                print(l)
        l+=1
        


inp = int(input("Podaj maksymalną liczbę zamykającą zakres l. pierwszych: "))
primesGen(inp)
