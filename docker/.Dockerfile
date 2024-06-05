FROM python:3.11-alpine

# Set environment variables to prevent Python from writing .pyc files to disk and to prevent stdout/stderr from being buffered
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk update && apk upgrade

# Install curl, and other dependencies
RUN apk add --no-cache curl gcc g++ musl-dev libffi-dev openssl-dev

# Install Poetry
RUN apk add --no-cache curl \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && ln -s /root/.local/bin/poetry /usr/local/bin/poetry

WORKDIR /usr/src/app

# Copy only the pyproject.toml and poetry.lock to leverage Docker cache
COPY pyproject.toml poetry.lock ./
COPY ./src ./src

# Install the dependencies in a virtual environment using Poetry
RUN poetry config virtualenvs.create true \
    && poetry install --no-root --no-interaction --no-ansi

EXPOSE 8000
CMD ["poetry", "run", "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000"]



