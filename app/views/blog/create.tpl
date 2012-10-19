<h1>Create a new entry</h1>

{{if $entry->hasError()}}
<div class="alert alert-block">
  <h4 class="alert-heading">Validation error!</h4>
  {{if $entry->validation_errors.title.length!=''}}
    <div><em>Title</em> must be
    between 
	{{$entry->validation.title.length.1|eh}}
	and 
	{{$entry->validation.title.length.2|eh}}
	characters in length.
    </div>
  {{/if}}
</div>
{{/if}}

<form class="well" method="post" action="{{url url=''|eh}}">
  <label>Title</label>
  <input type="text" class="span2" name="title"  value="{{Param::get('title')|eh}}">
  <label>Body</label>
  <textarea name="body">{{Param::get('body')|eh}}</textarea>
  <label>Postscript</label>
  <textarea name="postscript">{{Param::get('postscript')|eh}}</textarea>
  <br />
  <input type="hidden" name="page_next" value="create_end">
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
