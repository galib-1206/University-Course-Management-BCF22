#!/usr/bin/bash

# Function to run Gunicorn
run_gunicorn() {
  echo "Running Gunicorn..."

  CORES=$(nproc)
  WORKERS=$((CORES * 2 + 1))

  exec gunicorn -c gunicorn_config.py \
    admin.wsgi:application
}

# Function to run collectstatic
run_collectstatic() {
  echo "Running collectstatic..."
  python manage.py collectstatic --no-input
  echo "Done collecting static files."
}

# Function to run migrate
run_migrate() {
  echo "Running migrate db..."
  python manage.py migrate
  echo "Done migrating db."
}

# Check if any argument is passed
if [[ "$1" == "collectstatic" ]]; then
  run_collectstatic
elif [[ "$1" == "collectstaticandrun" ]]; then
  run_collectstatic
  sleep 1
  run_gunicorn
elif [[ "$1" == "migrate" ]]; then
  run_migrate
elif [[ "$1" == "collectstaticandmigrateandrun" ]]; then
  run_collectstatic
  sleep 1
  run_migrate
  sleep 1
  run_gunicorn
else
  run_gunicorn
fi