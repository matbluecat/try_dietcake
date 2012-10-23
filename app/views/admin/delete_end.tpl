<ul class="breadcrumb">
  <li><a href="{{url url='admin/index'}}">Admin</a> <span class="divider">/</span></li>
  <li><a href="{{url url='admin/view' entry_id=$entry->id}}">Entry</a> <span class="divider">/</span></li>
  <li class="active">Delete</li>
</ul>

<h2>{{$entry->title|eh}}</h2>

<p class="alert alert-success">
  You successfully deleted.
</p>

<a href="{{url url='admin/index'|eh}}">&larr; Go to top</a>
