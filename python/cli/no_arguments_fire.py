#!/usr/bin/env python3
"""
With no arguments Fire reads all code base

Good to understand someone else's code or debug your own
"""
import fire

def greet(greeting='Hiya', name='Tammy'):
    print(f"{greeting} {name}")

def goodbye(goodbye='Bye', name='Tammy'):
    print(f"{goodbye} {name}")

if __name__ == '__main__':
    fire.Fire()
