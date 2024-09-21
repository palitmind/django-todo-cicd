FROM python:3

RUN apt-get update && \
    apt-get install -y \
    python3-distutils \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip install --upgrade pip setuptools

WORKDIR /app

# Install Python dependencies
RUN pip install django==3.2

COPY . .


RUN python manage.py migrate

# Expose port 8000 to the outside world
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
