import copy

class Prototype:

    def __init__(self):
        self._objects = {}

    def register_object(self, name, obj):
        """Register object, name as a key"""
        self._objects[name] = obj

    def unregister_object(self, name):
        """Unregister object"""
        del self._objects[name]

    def clone(self, name, **attr):
        """Clone specified objects and update its attributes"""
        obj = copy.deepcopy(self._objects[name])
        obj.__dict__.update(attr)
        return obj


class Car():
    def __init__(self):
        self.name = "Mazda"
        self.color = "Red"
        self.options = "Rotor"

    def __str__(self):
        return f"{self.name} | {self.color} | {self.options}"

c = Car()
p = Prototype()
p.register_object("mazda", c)
print(p.clone("mazda"))
