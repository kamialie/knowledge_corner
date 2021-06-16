#!/usr/local/bin/python3

def unpack(x):
    print(x)
    return int(x[1]), x[0]

def print_sorted_countries():
    list_of_tuples = [
        ('Russia', '25'),
        ('France', '132'),
        ('Germany', '132'),
        ('Spain', '178'),
        ('Italy', '162'),
        ('Portugal', '17'),
        ('Finland', '3'),
        ('Hungary', '2'),
        ('The Netherlands', '28'),
        ('The USA', '610'),
        ('The United Kingdom', '95'),
        ('China', '83'),
        ('Iran', '76'),
        ('Turkey', '65'),
        ('Belgium', '34'),
        ('Canada', '28'),
        ('Switzerland', '26'),
        ('Brazil', '25'),
        ('Austria', '14'),
        ('Israel', '12')
    ]

    contries = dict(list_of_tuples)

    sorted_list = sorted(contries.items(), key=lambda x: (-int(x[1]), x[0]))
    for entry in sorted_list:
        print(entry[0])


if __name__ == "__main__":
    print_sorted_countries()
