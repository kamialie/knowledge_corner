class Home(object):
    def accept(self, visitor):
        visitor.visit(self)

    def work_on_hvac(self, hvac_specifalist):
        print(self, f"worked on by {hvac_specifalist}")

    def work_on_electricity(self, electrician):
        print(self, f"worked on by {electrician}")

    def __str__(self):
        return self.__class__.__name__

class Visitor(object):
    """Abstract class"""

    def __str__(self):
        return self.__class__.__name__

class HvacSpecialist(Visitor):
    def visit(self, house):
        house.work_on_hvac(self)

class Electrician(Visitor):
    def visit(self, house):
        house.work_on_electricity(self)

hvac_spec = HvacSpecialist()

electrician = Electrician()

house = Home()

house.accept(hvac_spec)
house.accept(electrician)
