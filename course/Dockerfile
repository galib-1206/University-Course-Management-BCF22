# Use a smaller, official base image
FROM python:3.12.5-alpine3.20

# Metadata of the Image
LABEL maintainer="Projects BD"

# Set the working directory and copy files efficiently
WORKDIR /app/course

# Copy only the requirements first to leverage Docker cache for dependencies
COPY ./requirements.txt .

# Install Python dependencies in one layer to reduce image size
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir --upgrade setuptools \
    && pip install --no-cache-dir gunicorn

# Copy the application source code
COPY . .

RUN python manage.py makemigrations
RUN python manage.py migrate

CMD ["gunicorn", "--bind", "0.0.0.0:8080", "course.wsgi:application"]