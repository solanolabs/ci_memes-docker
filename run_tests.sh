#!/bin/bash

/start-nginx.sh &
/start-php5-fpm.sh &
/start-mysqld.sh &

# wait for mysql server to start
timeout=10
echo -n "Waiting for database server to accept connections"
while ! /usr/bin/mysqladmin -u root status >/dev/null 2>&1
do
  timeout=$(($timeout - 1))
  if [ $timeout -eq 0 ]; then
    echo -e "\nCould not connect to database server. Aborting..."
    exit 1
  fi
  echo -n "."
  sleep 1
done

echo "Running tests"
# This is an extrememly simple example test:
# The 'NO_ERROR' portion of the php script should only be reached if there are...no errors
NO_ERROR_COUNT=`curl http://localhost/ | grep -c NO_ERROR`

if [[ "1" == "$NO_ERROR_COUNT" ]]; then
  EXIT_CODE=0
  echo "One occurrence of 'NO_ERROR' correctly identified in html output"
else
  EXIT_CODE=1
  echo "ERROR: $NO_ERROR_COUNT occurrences of 'NO_ERROR' in html output"
fi

exit $EXIT_CODE
