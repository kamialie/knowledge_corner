#!/usr/local/bin/python3

def get_data():
    with open("ds.csv") as fh:
        data = []
        for line in fh:
            lst = []

            end = line.index(',')
            lst.append(line[0:end])
            line = line[end + 1:]

            end = line.index(',')
            lst.append(line[0:end])
            line = line[end + 1:]

            start = line.rindex(',')
            lst.insert(2, line[start + 1:-1])
            line = line[:start]

            start = line.rindex(',')
            lst.insert(2, line[start + 1:])
            lst.insert(2, line[:start])

            data.append(lst)
        return data


def write_data(data):
    with open("ds.tsv", "w") as fh:
        for line in data:
            cline = ',\t'.join(line)
            fh.write(f"{cline}\n")

if __name__ == "__main__":
    data = get_data()
    write_data(data)
