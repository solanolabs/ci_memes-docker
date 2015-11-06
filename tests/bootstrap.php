<?php

require dirname(__DIR__) . '/vendor/autoload.php';

global $container_ip_addr, $db_creds;
$container_ip_addr = trim(file_get_contents(getenv('TDDIUM_REPO_ROOT') . '/container-' . getenv('TDDIUM_SESSION_ID'). '.ip'));
$db_creds = array(
  'host' => 'localhost',
  'user' => getenv('TDDIUM_DB_USER'),
  'pass' => getenv('TDDIUM_DB_PASSWORD'),
  'name' => getenv('TDDIUM_DB_NAME'),
  'port' => getenv('TDDIUM_DB_PORT'),
  'sock' => getenv('TDDIUM_DB_SOCKET')
);
