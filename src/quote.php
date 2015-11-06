<html>
  <head>
    <title>Solano CI Memes</title>
    <link href="css/ci_memes.css" media="screen" rel="stylesheet" type="text/css" />
    <noscript>
      <meta http-equiv="refresh" content="8" />
    </noscript>
  </head>
  <body>
    <header>
      <div class="wrapper">
        <h1 id="logo">
          <a href="https://www.solanolabs.com/">Solano Labs</a>
        </h1>
        <h2 id="title">CI Memes and Quotes</h2>
      </div>
    </header>
    <section id="content">
      <?php 
        // Load memes and quotes
        require_once(dirname(__FILE__) . '/php/fetch_data.php');

        if (!isset($_GET['quote_id']) || empty($quotes[$_GET['quote_id']])) {
          echo ('<h1 class="fetch_error">"quote_id" parameter either not supplied or invalid</h1>');
        } else {
          echo ('<div class="quote_wrapper" style="display:block;" id="quote_wrapper_' . $i . '">');
          echo ('<h2>' . $quotes[$_GET['quote_id']] . '</h2>');
          echo ('</div>');
        }
      ?>
    </section>
  </body>
<!--
  An error will prevent this comment from being returned in the output: 
  NO_ERROR
-->
</html>
