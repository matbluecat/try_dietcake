<h1>{{$entry->title|eh}}</h1>

<div class="entry">
  <div class="created">
    {{$entry->created|eh}}
  </div>
  <div class="body">
    {{$entry->body|eh}}
  </div>
  <div class="post_script">
	<a name="postscript"></a>
    {{$entry->postscript|eh}}
  </div>
</div>

<hr>

<form class="well" method="post" action="{{url url='blog/delete'|eh}}">
  <input type="hidden" name="entry_id" value="{{$entry->id|eh}}">
  <input type="hidden" name="page_next" value="delete_end">
  <button type="submit" class="btn btn-danger">Delete</button>
</form>

<form class="well" method="get" action="{{url url='blog/view'|eh}}">
  <input type="hidden" name="entry_id" value="{{$entry->id|eh}}">
  <button type="submit" class="btn">Back</button>
</form>
