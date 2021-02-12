class Korean:
    def __init__(self):
        self.name = "Korean"

    def speak_korean(self):
        return "An-neyong?"


class British:
    def __init__(self):
        self.name = "British"

    def speak_english(self):
        return "Hello!"


class Adapter:
    def __init__(self, object, **adapted_methods):
        self._object = object

        # add a mapping between generic method, speak() and concrete,
        # speak_english() or speak_korean()
        # key - name of generic method, value - name of concrete method
        self.__dict__.update(adapted_methods)

    def __getattr__(self, attr):
        return getattr(self._object, attr)


objects = []

korean = Korean()
british = British()

objects.append(Adapter(korean, speak=korean.speak_korean))
objects.append(Adapter(british, speak=british.speak_english))

for obj in objects:
    print(f"{obj.name} says {obj.speak()}")
