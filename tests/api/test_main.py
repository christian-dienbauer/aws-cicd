import requests

SERVER_URL = "http://0.0.0.0:8000"

def test_root():

    response = requests.get(f"{SERVER_URL}/")

    body = response.json()

    assert response.status_code == 200
    assert body == {"greeting":"Hello World"}