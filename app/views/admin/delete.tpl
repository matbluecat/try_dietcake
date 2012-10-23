<ul class="breadcrumb">
  <li><a href="{{url url='admin/index'}}">Admin</a> <span class="divider">/</span></li>
  <li><a href="{{url url='admin/view' entry_id=$entry->id}}">Entry</a> <span class="divider">/</span></li>
  <li class="active">Delete</li>
</ul>

<h1>{{$entry->title|eh}}</h1>

<div class="entry">
  <div class="created">
    {{$entry->created|eh}}
  </div>
  <div class="body">
    {{$entry->body|eh|nl2br}}
  </div>
  <div class="post_script">
	<a name="postscript"></a>
    {{$entry->postscript|eh|nl2br}}
  </div>
</div>

<hr>

<form class="well" method="post" action="{{url url='admin/delete'|eh}}">
  <input type="hidden" name="entry_id" value="{{$entry->id|eh}}">
  <input type="hidden" name="page_next" value="delete_end">
  <button type="submit" class="btn btn-danger">Delete</button>
</form>

<form class="well" method="get" action="{{url url='admin/view'|eh}}">
  <input type="hidden" name="entry_id" value="{{$entry->id|eh}}">
  <button type="submit" class="btn">Back</button>
</form>
