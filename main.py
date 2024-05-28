from fastapi import FastAPI
from greetings import get_greeting

app = FastAPI()

@app.get("/")
def read_root():
    greeting = get_greeting("Chris")
    return {"greeting": greeting}
