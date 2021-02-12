import time

class Producer:
    """Resource intensive class"""
    def produce(self):
        print("Working hard!")

    def meet(self):
        print("Has time to meet you now!")

class Proxy:
    """Middleman which is relatively less resource intensive"""
    def __init__(self):
        self.occupied = 'No'
        self.producer = None

    def produce(self):
        print("Checking if producer is available")

        if self.occupied == 'No':
            self.producer = Producer()
            produce.meet()


        else:
            print("Producer is busy!")
            time.sleep(2)
