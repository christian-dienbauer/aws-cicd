"""
Provides an interface to retrieve a greeting.
"""

from fastapi import FastAPI

from src.greetings import get_greeting

app = FastAPI()


@app.get("/")
def read_root():
    """
    The root api returns a greeting message
    """
    greeting = get_greeting("World")
    return {"greeting": greeting}
