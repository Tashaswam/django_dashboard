# 1. Use a lightweight base image
FROM python:3.10-slim

# 2. Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 3. Set work directory inside the container
WORKDIR /app

# 4. Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# 5. Copy project files into container
COPY . .

# 6. Start the app with gunicorn (Render will inject PORT env var)
CMD gunicorn django_dashboard.wsgi:application --bind 0.0.0.0:$PORT
