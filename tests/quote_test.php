<?php
class Test_Quote extends PHPUnit_Framework_TestCase
{
  /**
   * @dataProvider quotes_fetch
   */
  public function testTest_Quote($quote_id, $quote_text)
  {
    global $container_ip_addr;
    $url = 'http://' . $container_ip_addr . '/quote.php?quote_id=' . $quote_id;
    $client = new GuzzleHttp\Client();
    $response = $client->request('GET', $url);
    $this->assertEquals('200', $response->getStatusCode());
    $body = (string)$response->getBody();
    $this->assertGreaterThan(0, strpos($body, $quote_text)); // Ensure the quote text is present
    $this->assertGreaterThan(0, strpos($body, 'NO_ERROR')); // PHP errors will prevent "NO_ERROR" from being returned
  }

  public function quotes_fetch()
  {
    global $db_creds;
    $conn = new mysqli($db_creds['host'], $db_creds['user'], $db_creds['pass'], $db_creds['name'], $db_creds['port'], $db_creds['sock']);
    if ($conn->connect_error) { trigger_error('Db connection error: ' . $conn->connect_error, E_USER_ERROR); }
    $sql = "SELECT quote FROM chuck_quotes";
    $records = $conn->query($sql);
    if ($records === false) { trigger_error('No records returned?!?'); }
    $records->data_seek(0);
    $quotes = array();
    $quote_id = 0;
    while($record = $records->fetch_row()) {
      $quotes[] = array($quote_id, $record[0]);
      $quote_id++;
    }
    $conn->close();
    return $quotes; 
  }
}
