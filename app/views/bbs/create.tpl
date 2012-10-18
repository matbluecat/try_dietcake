<h1>Create a thread</h1>

{{if $thread->hasError() || $comment->hasError()}}
えらー
{{/if}}
{{if $thread->hasError() || $comment->hasError()}}
<div class="alert alert-block">
  <h4 class="alert-heading">Validation error!</h4>
  {{if $thread->validation_errors.title.length!=''}}
    <div><em>Title</em> must be
    between 
	{{$thread->validation.title.length.1|eh}}
	and 
	{{$thread->validation.title.length.2|eh}}
	characters in length.
    </div>
  {{/if}}
  {{if $comment->validation_errors.username.length}}
    <div><em>Your name</em> must be
    between 
	{{$comment->validation.username.length.1|eh}}
	and 
	{{$comment->validation.username.length.2|eh}}
	characters in length.
    </div>
  {{/if}}
  {{if $comment->validation_errors.body.length}}
    <div><em>Comment</em> must be
    between {{$comment->validation.body.length.1|eh}} and {{$comment->validation.body.length.2|eh}} characters in length.
    </div>
  {{/if}}
</div>
{{/if}}

<form class="well" method="post" action="{{url url=''|eh}}">
  <label>Title</label>
  <input type="text" class="span2" name="title"  value="{{Param::get('title')|eh}}">
  <label>Your name</label>
  <input type="text" class="span2" name="username"  value="{{Param::get('username')|eh}}">
  <label>Comment</label>
  <textarea name="body">{{Param::get('body')|eh}}</textarea>
  <br />
  <input type="hidden" name="page_next" value="create_end">
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
