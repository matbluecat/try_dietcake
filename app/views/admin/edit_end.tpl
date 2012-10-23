<ul class="breadcrumb">
  <li><a href="{{url url='admin/index'}}">Admin</a> <span class="divider">/</span></li>
  <li><a href="{{url url='admin/view' entry_id=$entry->id}}">Entry</a> <span class="divider">/</span></li>
  <li class="active">Edit</li>
</ul>

<h2>{{$entry->title|eh}}</h2>

<p class="alert alert-success">
  You successfully edited.
</p>

<a href="{{url url='admin/view' entry_id=$entry->id|eh}}">&larr; Go to entry</a>
