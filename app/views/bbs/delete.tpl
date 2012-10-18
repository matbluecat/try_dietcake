<h1>{{$thread->title|eh}}</h1>

{{foreach from=$comments item=item key=key}}
<div class="comment">
  <div class="meta">
    {{($key+1)|eh}} : {{$item->username|eh}} {{$item->created|eh}}
  </div>
  <div>
	{{$item->body|eh}}
  </div>
</div>
{{/foreach}}


<hr>

<form class="well" method="post" action="{{url url='bbs/delete'|eh}}">
  <input type="hidden" name="thread_id" value="{{$thread->id|eh}}">
  <input type="hidden" name="page_next" value="delete_end">
  <button type="submit" class="btn btn-danger">Delete</button>
</form>

<form class="well" method="get" action="{{url url='bbs/view'|eh}}">
  <input type="hidden" name="thread_id" value="{{$thread->id|eh}}">
  <button type="submit" class="btn">Back</button>
</form>
