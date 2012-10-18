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

<form class="well" method="post" action="{{url url='bbs/write'|eh}}">
  <label>Your name</label>
  <input type="text" class="span2" name="username"  value="{{Param::get('username')|eh}}">
  <label>Comment</label>
  <textarea name="body">{{Param::get('body')|eh}}</textarea>
  <br />
  <input type="hidden" name="thread_id" value="{{$thread->id|eh}}">
  <input type="hidden" name="page_next" value="write_end">
  <button type="submit" class="btn btn-primary">Submit</button>
</form>


<form class="well" method="post" action="{{url url='bbs/delete'|eh}}">
  <input type="hidden" name="thread_id" value="{{$thread->id|eh}}">
  <button type="submit" class="btn btn-danger">Delete this thread</button>
</form>

