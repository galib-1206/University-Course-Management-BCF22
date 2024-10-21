#!/bin/sh

# Wait for PostgreSQL to start
while ! nc -z student_db 5432; do   
  sleep 0.1 # wait for 1/10 of a second before checking again
done

echo "PostgreSQL started"
