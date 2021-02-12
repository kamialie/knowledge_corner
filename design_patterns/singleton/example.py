class Borg():
    """Borg class making class attribute global"""
    _shared_state = {}

    def __init__(self):
        self.__dict__ = self._shared_state # make it an instance attribute


class Singleton(Borg):
    """Singleton class shares all its attributes among its various instances"""

    def __init__(self, **kwargs):
        Borg.__init__(self)
        self._shared_state.update(kwargs) # update attribute dictionary

    def __str__(self):
        return str(self._shared_state)


x = Singleton(key1 = "value1")
print(x)

y = Singleton(key2 = "value2")
print(y)
