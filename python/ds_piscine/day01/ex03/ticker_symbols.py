#!/usr/local/bin/python3

import sys

def print_price(company):
    companies = {
        'Apple' : 'AAPL',
        'Microsoft' : 'MSFT',
        'Netflix' : 'NFLX',
        'Tesla' : 'TSLA',
        'Nokia' : 'NOK'
    }

    stocks = {
        'AAPL' : 287.73,
        'MSFT' : 173.79,
        'NFLX' : 416.90,
        'TSLA' : 724.88,
        'NOK' : 3.37
    }
    for k,v in companies.items():
        if company.lower() == v.lower():
            print(k, stocks[v])
            return

    print("Unknown ticker")

if __name__ == "__main__":
    if len(sys.argv) == 2:
        print_price(sys.argv[1])
