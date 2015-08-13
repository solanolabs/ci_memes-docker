#!/bin/bash

set -e

# Start mysql
/start-mysqld.sh &
PID=$!

# wait for mysql server to start
timeout=10
echo -n "Waiting for database server to accept connections"
while ! /usr/bin/mysqladmin -u root status >/dev/null 2>&1
do
  timeout=$(($timeout - 1))
  if [ $timeout -eq 0 ]; then
    echo -e "\nERROR: Could not connect to database server. Aborting..."
    exit 1
  fi
  echo -n "."
  sleep 1
done
echo  "Database accepting connections\n"

# Install database
echo "Installing ci_memes database"
mysql -u root < /create-db.sql

# Grant permissions
echo "Granting permissions on ci_memes database"
mysql -u root --execute="GRANT ALL ON ci_memes.* TO 'ci_memes'@'localhost' IDENTIFIED BY 'cicicicici_memememess'"

# Stop database
kill $PID
