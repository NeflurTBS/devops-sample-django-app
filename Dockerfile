FROM python:3.8

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV DJANGO_DB_HOST=db \
    DJANGO_DB_NAME=app \
    DJANGO_DB_USER=worker \
    DJANGO_DB_PASS=worker \
    DJANGO_DB_PORT=5432 \
    DJANGO_DEBUG=False


CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
