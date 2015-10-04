<html>
  <head>
    <title>Solano CI Memes</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="js/ci_memes.js"></script>
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

        // Write memes
        for ($i = 0; $i < count($memes); $i++) {
          echo ('<div class="meme_wrapper" id="meme_wrapper_' . $i . '">');
          if (empty($memes[$i]->html)) {
            echo ('<img src="' . $memes[$i]->image_url . '" />');
          } else {
            echo (str_replace('__IMAGE__', $memes[$i]->image_url, $memes[$i]->html));
          }
          echo ('</div>');
        }

        // Write quotes
        for ($i = 0; $i < count($quotes); $i++) {
          echo ('<div class="quote_wrapper" id="quote_wrapper_' . $i . '">');
          echo ('<h2>' . $quotes[$i] . '</h2>');
          echo ('</div>');
        }

        // Write JS vars
        echo ('<script>var meme_id=0, quote_id=0, meme_chance=' . $meme_chance . ', showing="meme_wrapper_0", display_period=' . $display_period . ' </script>');


      ?>
    </section>
  </body>
<!--
  An error will prevent this comment from being returned in the output: 
  NO_ERROR
-->
</html>
