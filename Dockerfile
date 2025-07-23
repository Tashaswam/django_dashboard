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

# 6. Expose dynamic port and run the app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

