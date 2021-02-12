class Component(object):
    """Abstract class"""

    def __init__(self, *args, **kwargs):
        pass

    def component_function(self):
        pass


class Child(Component):
    """Concrete class"""

    def __init__(self, *args, **kwargs):
        Component.__init__(self, args, kwargs)

        self.name = args[0]

    def component_function(self):
        print(f"{self.name}")


class Composite(Component):
    """Concrete class that maintains the tree recursive structure"""

    def __init__(self, *args, **kwargs):
        Component.__init__(self, args, kwargs)

        self.name = args[0]

        self.children = []

    def append_child(self, child):
        self.children.append(child)

    def remove_child(self, child):
        self.children.remove(child)

    def component_function(self):
        print(f"{self.name}")

        for child in self.children:
            child.component_function()

sub1 = Composite("sub1")

sub11 = Child("sub-submenu 11")
sub12 = Child("sub-submenu 12")

sub1.append_child(sub11)
sub1.append_child(sub12)

top = Composite("menu")

sub2 = Child("submenu2")

top.append_child(sub1)
top.append_child(sub2)

top.component_function()
