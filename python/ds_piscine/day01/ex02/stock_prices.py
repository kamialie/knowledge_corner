#!/usr/local/bin/python3

import sys

def get_price(company):
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
    if company not in companies:
        return "Unknown company"

    return stocks[companies[company]]

if __name__ == "__main__":
    if len(sys.argv) == 2:
        print(get_price(sys.argv[1]))
