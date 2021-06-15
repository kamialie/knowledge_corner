#!/usr/local/bin/python3

def get_dict():
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

    d = {}
    for item in list_of_tuples:
        if item[1] in d:
            d[item[1]].append(item[0])
        else:
            d[item[1]] = [item[0]]

    return d


if __name__ == "__main__":
    d = get_dict()
    for k,v in d.items():
        for county in v:
            print(f"'{k}' : '{county}'")
