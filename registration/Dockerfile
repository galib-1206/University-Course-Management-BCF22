# Use a smaller, official base image
FROM python:3.12.5-alpine3.20

# Metadata of the Image
LABEL maintainer="Projects BD"

# Set the working directory and copy files efficiently
WORKDIR /app/registration

# Copy only the requirements first to leverage Docker cache for dependencies
COPY ./requirements.txt .

# Install Python dependencies in one layer to reduce image size
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir --upgrade setuptools \
    && pip install --no-cache-dir gunicorn

COPY . .

RUN python manage.py makemigrations
RUN python manage.py migrate

RUN python manage.py create_admin

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "registration.wsgi:application"]