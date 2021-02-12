from functools import wraps

def make_blink(function):
    """Decorator definition"""

    @wraps(function)

    def decorator():
        # grab the value returned by original funciton
        ret = function()

        # add additional behaviour
        return f"<blink>{ret}</blink>"

    return decorator


@make_blink
def hello_world():
    """Original function"""

    return "hello, world"


print(hello_world())
