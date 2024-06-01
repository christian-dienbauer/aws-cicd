

run:
	uvicorn src.main:app --host 127.0.0.1 --port 8080 --reload

test_unit:
	pytest tests/unit -v

test_api:
	pytest tests/api -v
