#!/usr/local/bin/python3

def data_type():
    n = 1
    st = "string"
    f = 1.5
    b = True
    l = []
    d = {}
    t = 1,2
    s = set("set")

    print(f"[{type(n).__name__}, {type(st).__name__}, {type(f).__name__}, {type(b).__name__}, {type(l).__name__}, {type(d).__name__}, {type(t).__name__}, {type(s).__name__}]")

if __name__ == "__main__":
    data_type()
