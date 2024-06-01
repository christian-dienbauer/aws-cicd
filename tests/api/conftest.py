import pytest
import subprocess
import time
import requests

# Adjust the command as needed for your application
START_SERVER_COMMAND = ["make", "run"]
SERVER_URL = "http://127.0.0.1:8080"  # Update the URL and port as needed

@pytest.fixture(scope="session", autouse=True)
def start_server():
    """Fixture to start the server before tests and stop it after."""
    # Start the server
    server_process = subprocess.Popen(START_SERVER_COMMAND)
    
    # Wait for the server to be ready
    time.sleep(5)
    
    # Check if the server is up
    try:
        requests.get(SERVER_URL)
    except requests.exceptions.ConnectionError:
        server_process.terminate()
        raise RuntimeError("Server did not start")
    
    # Yield control to the tests
    yield
    
    # Stop the server after tests
    server_process.terminate()
    server_process.wait()