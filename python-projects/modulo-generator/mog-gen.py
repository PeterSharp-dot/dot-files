#!/usr/bin/env python

x = 0
while x <= 101:
    for i in range(1,11):
        print(f"{x} % {i} = {x % i}")
    print("---------")
    x += 1
    

