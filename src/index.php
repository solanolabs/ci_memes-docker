<html>
  <head>
    <title>Solano CI Memes and Quotes</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script>
	solano_refresh=window.setTimeout(function(){window.location.href=window.location.href},8000);
    </script>
    <noscript>
      <meta http-equiv="refresh" content="8" />
    </noscript>
    <style>
      html { text-align: center; }
    </style> 
  </head>
  <body>
<?php
$db_name = 'ci_memes';
$db_user = 'ci_memes';
$db_host = 'localhost';
$db_pass = 'cicicicici_memememess';

$mysqli = new mysqli($db_host, $db_user, $db_pass, $db_name);
if (mysqli_connect_errno()) {
  printf("Connect failed: %s\n", mysqli_connect_error());
  exit();
}
$sql = "SELECT SQL_CALC_FOUND_ROWS image_url, html FROM images ORDER BY rand() LIMIT 1;";
$sql .= "SELECT FOUND_ROWS();";
if ($mysqli->multi_query($sql)) {
  $results = $mysqli->store_result();
  $record = $results->fetch_row();
  $image = array('image_url' => $record[0], 'html' => $record[1]);
  $results->free();
  $mysqli->next_result();
  $results = $mysqli->store_result();
  $record = $results->fetch_row();
  $image_count = $record[0];
  $results->free();
  $random_num = rand(1, $image_count + 2);
  if ($random_num > $image_count) {
    // Use quote instead
    $sql = "SELECT quote FROM chuck_quotes ORDER BY rand() LIMIT 1";
    $results = $mysqli->query($sql);
    $record = $results->fetch_row();
    echo ('<h1>' . $record[0] . '</h1>');
  } else {
    // Show image
    if (empty($image['html'])) {
      echo ('<img src="' . $image['image_url'] . '" />');
    } else {
      $html = str_replace('__IMAGE__', $image['image_url'], $image['html']);
      echo ($html);
    }
  }
}
$mysqli->close();
?>
  <!--
    An error will prevent this comment from being returned in the output: 
    NO_ERROR
  -->
  </body>
</html>
