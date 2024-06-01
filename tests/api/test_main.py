import requests

BASE_URL = "http://127.0.0.1:8080"

def test_root():

    response = requests.get(f"{BASE_URL}/")

    body = response.json()

    assert response.status_code == 200
    assert body == {"greeting":"Welcome Chris"}