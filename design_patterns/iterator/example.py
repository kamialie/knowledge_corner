def count_to(count):
    """iterator implementation"""

    # custom list
    numbers_in_german = ["eins", "zwei", "drei", "vier", "funf"]

    # built-in iterator
    # creates tuples (1, "eins")
    iterator = zip(range(count), numbers_in_german)

    for position, number in iterator:
        yield number


for num in count_to(3):
    print(num)
