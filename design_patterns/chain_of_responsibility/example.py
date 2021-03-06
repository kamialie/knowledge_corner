class Handler:
    """Abstract handler"""
    def __init__(self, successor):
        self._successor = successor # define the next handler

    def handle(self, request):
        handled = self._handle(request) # if handled, stop

        # otherwise go to next
        if not handled:
            self._successor.handle(request)

    def _handle(self, request):
        raise NotImplementedError("Must provide an implementation in subclass!")

class Handler1(Handler):
    def _handle(self, request):
        if 0 < request <= 10:
            print(f"Requst {request} handled in handler 1")
            return True # indiciates that the request has been handled

class DefaultHandler(Handler):
    def _handle(self, request):
        print(f"End of chain, no handler for {request}")
        return True # indiciates that the request has been handled

class Client:
    def __init__(self):
        self.handler = Handler1(DefaultHandler(None)) # define the chain of handlers

    def delegate(self, requests):
        for request in requests:
            self.handler.handle(request)

c = Client()

requests = [2, 5, 30]

c.delegate(requests)
