<ul class="breadcrumb">
  <li><a href="{{url url='admin/index'}}">Admin</a> <span class="divider">/</span></li>
  <li class="active">Create</li>
</ul>

<h2>{{$entry->title|eh}}</h2>

<p class="alert alert-success">
  You successfully created.
</p>

<a href="{{url url='admin/view' entry_id=$entry->id|eh}}">&larr; Go to entry</a>
