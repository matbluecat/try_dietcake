<ul class="breadcrumb">
  <li><a href="{{url url='admin/index'}}">Admin</a> <span class="divider">/</span></li>
  <li class="active">Login</li>
</ul>

<h1>Login</h1>

<form class="well" method="post" action="{{url url='admin/login'|eh}}">
  <label>admin_id</label>
  <input type="text" class="span2" name="admin_id" value="" />
  <label>pass</label>
  <input type="text" class="span2" name="pass" value="" />
  <input type="hidden" name="page_next" value="login_end">
  <button type="submit" class="btn btn-primary">Login</button>
</form>
