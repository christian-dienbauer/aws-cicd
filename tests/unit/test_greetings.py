import pytest
from src.greetings import get_greeting


def test_greetings():

    name = "Chris"

    greeting = get_greeting(name)

    assert greeting == 'Welcome Chris'

def test_greetings_no_name():

    name = ""

    with pytest.raises(ValueError, match="Name is missing!"):
        get_greeting(name)