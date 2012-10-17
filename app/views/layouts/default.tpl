<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <title>DietCake Message Board</title>

    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
      body {
        padding-top: 60px;
      }
    </style>
  </head>

  <body>

    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="brand" href="{{url url="/"}}">DietCake Message Board</a>
        </div>
      </div>
    </div>

    <div class="container">
	{{$_contents}}
    </div>
	{{"'"|eh}}

    <script>
    console.log(<?php eh(round(microtime(true) - TIME_START, 3)) ?> + 'sec');
    </script>

  </body>
</html>
