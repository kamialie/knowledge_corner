class DrawCircleAPIOne(object):
    """Implementation-specific abstraction"""

    def draw_circle(self, x, y, radius):
        print(f"API 1 drawing circle at {x}, {y}, with radius {radius}")


class DrawCircleAPITwo(object):
    """Implementation-specific abstraction"""

    def draw_circle(self, x, y, radius):
        print(f"API 2 drawing circle at {x}, {y}, with radious {radius}")


class Circle(object):
    """Implementation-independent abstraction"""

    def __init__(self, x, y, radius, drawing_api):
        self._x = x
        self._y = y
        self._radius = radius
        self._drawing_api = drawing_api

    def draw(self):
        self._drawing_api.draw_circle(self._x, self._y, self._radius)


    def scale(self, percent):
        self._radius *= percent


circle = Circle(2, 3, 4, DrawCircleAPIOne())

circle.draw()
