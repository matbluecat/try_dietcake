<h2>{{$thread->title}}</h2>

{{if $comment->hasError()}}
<div class="alert alert-block">
  <h4 class="alert-heading">Validation error!</h4>
  {{if $comment->validation_errors.username.length!=''}}
    <div><em>Your name</em> must be
    between {{$comment->validation.username.length.1}} and {{$comment->validation.username.length.2}} characters in length.
    </div>
  {{/if}}

  {{if $comment->validation_errors.body.length!=''}}
    <div><em>Comment</em> must be
    between {{$comment->validation.body.length.1}} and {{$comment->validation.body.length.2}} characters in length.
    </div>
  {{/if}}
</div>
{{/if}}

<form class="well" method="post" action="{{smarty_url url=''}}">
  <label>Your name</label>
  <input type="text" class="span2" name="username"  value="{{Param::get('username')|eh}}">
  <label>Comment</label>
  <textarea name="body">{{Param::get('body')|eh}}</textarea>
  <br />
  <input type="hidden" name="thread_id" value="{{$thread->id|eh}}">
  <input type="hidden" name="page_next" value="write_end">
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
