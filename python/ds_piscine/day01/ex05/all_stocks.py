#!/usr/local/bin/python3

import sys

def identify(data):
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

    items = data.split(',')

    strip_items = []
    for item in items:
        strip_items.append(item.strip())
    if '' in strip_items:
        return

    for item in strip_items:
        l_item = item.lower()

        company = get_company(l_item, companies)
        if company is not None:
            print(company, "stock price is", stocks[companies[company]])
            continue

        company = get_company_from_ticker(l_item, companies)
        if company is not None:
            print(companies[company], "is a ticker symbol for", company)
            continue

        print(item, "is an unknown company or an unknown ticker symbol")

def get_company(item, companies):
    for company in companies:
        if company.lower() == item:
            return company

def get_company_from_ticker(item, companies):
    for company, ticker in companies.items():
        if ticker.lower() == item:
            return company

if __name__ == "__main__":
    if len(sys.argv) == 2:
        identify(sys.argv[1])
