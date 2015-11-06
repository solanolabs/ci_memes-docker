<?php
class Test_Meme extends PHPUnit_Framework_TestCase
{
  /**
   * @dataProvider memes_fetch
   */
  public function testTest_Meme($meme_id, $image_url)
  {
    global $container_ip_addr;
    $url = 'http://' . $container_ip_addr . '/memes.php?meme_id=' . $meme_id;
    $client = new GuzzleHttp\Client();
    $response = $client->request('GET', $url);
    $this->assertEquals('200', $response->getStatusCode());
    $body = (string)$response->getBody();
    $this->assertGreaterThan(0, strpos($body, $image_url)); // Ensure the image_url is present
    $this->assertGreaterThan(0, strpos($body, 'NO_ERROR')); // PHP errors will prevent "NO_ERROR" from being returned
  }

  public function memes_fetch()
  {
    global $db_creds;
    $conn = new mysqli($db_creds['host'], $db_creds['user'], $db_creds['pass'], $db_creds['name'], $db_creds['port'], $db_creds['sock']);
    if ($conn->connect_error) { trigger_error('Db connection error: ' . $conn->connect_error, E_USER_ERROR); }
    $sql = "SELECT image_url FROM images";
    $records = $conn->query($sql);
    if ($records === false) { trigger_error('No records returned?!?'); }
    $records->data_seek(0);
    $memes = array();
    $meme_id = 0;
    while($record = $records->fetch_row()) {
      $memes[] = array($meme_id, $record[0]);
      $meme_id++;
    }
    $conn->close();
    return $memes; 
  }
}
