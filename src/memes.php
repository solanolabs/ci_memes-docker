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

        if (!isset($_GET['meme_id']) || empty($memes[$_GET['meme_id']])) {
          echo ('<h1 class="fetch_error">"meme_id" parameter either not supplied or invalid</h1>');
        } else {
          echo ('<div class="meme_wrapper" style="display:block;" id="meme_wrapper_' . $i . '">');
          if (empty($memes[$_GET['meme_id']]->html)) {
            echo ('<img src="' . $memes[$_GET['meme_id']]->image_url . '" />');
          } else {
            echo (str_replace('__IMAGE__', $memes[$_GET['meme_id']]->image_url, $memes[$_GET['meme_id']]->html));
          }
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
