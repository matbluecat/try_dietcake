<h1>{{$entry->title|eh}}</h1>


<div class="entry">
  <div class="created">
    {{$entry->created|eh}}
  </div>
  <div class="body">
    {{$entry->body|eh}}
  </div>
  <div class="post_script">
    {{$entry->postscript|eh}}
  </div>
</div>


<hr />

<h2>Comment</h2>
{{foreach from=$blog_comments item=item name=blog_comment_loop}}
<div class="blog_comment">
  <div class="username">
    {{$item->username|eh}}
  </div>
  <div class="body">
    {{$item->body|eh}}
  </div>
  <div class="created">
    {{$item->created|eh}}
  </div>
</div>
{{if $smarty.foreach.blog_comment_loop.last}}
{{else}}
<hr />
{{/if}}
{{/foreach}}

<form class="well" method="post" action="{{url url='blog/write'|eh}}">
  <label>Your name</label>
  <input type="text" class="span2" name="username"  value="{{Param::get('username')|eh}}">
  <label>Comment</label>
  <textarea name="body">{{Param::get('body')|eh}}</textarea>
  <br />
  <input type="hidden" name="entry_id" value="{{$entry->id|eh}}">
  <input type="hidden" name="page_next" value="write_end">
  <button type="submit" class="btn btn-primary">Submit</button>
</form>


<form class="well" method="post" action="{{url url='blog/edit'|eh}}">
  <input type="hidden" name="entry_id" value="{{$entry->id|eh}}">
  <button type="submit" class="btn btn-info">Edit this entry</button>
</form>

<form class="well" method="post" action="{{url url='blog/delete'|eh}}">
  <input type="hidden" name="entry_id" value="{{$entry->id|eh}}">
  <button type="submit" class="btn btn-danger">Delete this entry</button>
</form>

