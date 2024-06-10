"""
Test the greetings module
"""

import pytest

from src.greetings import get_greeting


def test_greetings():
    """
    Test with a valid input name
    """

    name = "World"

    greeting = get_greeting(name)

    assert greeting == "Hello World"


def test_greetings_no_name():
    """
    Test without an input.
    """

    name = ""

    with pytest.raises(ValueError, match="Name is missing!"):
        get_greeting(name)
