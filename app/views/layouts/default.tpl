<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <title>DietCake Message Board</title>

    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/common/css/common.css" rel="stylesheet">
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

          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="">
                <a href="{{url url="/"}}">Home</a>
              </li>
              <li class="">
                <a href="{{url url="thread/index"}}">Thread</a>
              </li>
              <li class="">
                <a href="{{url url="bbs/index"}}">Bbs</a>
              </li>
              <li class="">
                <a href="{{url url="blog/index"}}">Blog</a>
              </li>
              <li class="">
                <a href="{{url url="admin/index"}}">Blog Admin</a>
              </li>
              <li class="">
			    {{if Session::get('login_admin_id')!=''}}
                  <a href="{{url url="admin/logout"}}">Admin Logout</a>
			    {{else}}
                  <a href="{{url url="admin/login"}}">Admin Login</a>
			    {{/if}}
              </li>
            </ul>
          </div>
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
