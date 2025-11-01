FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*



entrypoint
collectstatic --no-input
migrate

CMD ["gunicorn", "Exchange.wsgi:application", "--bind", "0.0.0.0:8000", "--workers", "3"]