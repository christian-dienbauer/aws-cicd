from src.greetings import get_greeting


def test_greetings():

    name = "Chris"

    greeting = get_greeting(name)

    assert greeting == 'Welcome Chris'

def test_greetings_no_name():
    pass