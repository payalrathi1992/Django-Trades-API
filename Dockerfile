# Simple Dockerfile for Django app (uses sqlite for demo)
FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

RUN python manage.py collectstatic --noinput || true
EXPOSE 8000

CMD ["gunicorn", "trade_api.wsgi:application", "--bind", "0.0.0.0:8000"]
