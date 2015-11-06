<?php
// Load config variables
require_once(dirname(__FILE__) . '/config.php');

// Connect to database
$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);
if (mysqli_connect_errno()) {
  printf("Connect failed: %s\n", mysqli_connect_error());
  exit();
}

// Fetch memes
$memes = array();
$sql = "SELECT image_url, html FROM images;";
$result = $mysqli->query($sql) or die($mysqli->error);
while ($meme = $result->fetch_object()) {
  $memes[] = $meme;
}
$result->close();

// Fetch quotes
$quotes = array();
$sql = "SELECT quote FROM chuck_quotes;";
$result = $mysqli->query($sql) or die($mysqli->error);
while ($record = $result->fetch_row()) {
  $quotes[] = $record[0];
}
$result->close();

// Close database connection
$mysqli->close();
