<ul class="breadcrumb">
  <li><a href="{{url url='admin/index'}}">Admin</a> <span class="divider">/</span></li>
  <li><a href="{{url url='admin/view' entry_id=$entry->id}}">Entry</a> <span class="divider">/</span></li>
  <li class="active">Edit</li>
</ul>

<h1>Edit an entry</h1>

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
  <input type="text" class="span2" name="title"  value="{{$entry->title|eh}}">
  <label>Body</label>
  <textarea name="body">{{$entry->body|eh}}</textarea>
  <label>Postscript</label>
  <textarea name="postscript">{{$entry->postscript|eh}}</textarea>
  <br />
  <input type="hidden" name="entry_id" value="{{$entry->id|eh}}" />
  <input type="hidden" name="page_next" value="edit_end">
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
