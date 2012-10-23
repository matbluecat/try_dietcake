<ul class="breadcrumb">
  <li class="active">Admin</li>
</ul>

<h1>Blog Admin</h1>

<a class="btn btn-large btn-primary" href="{{url url='admin/create'}}">Create new entry</a>

{{foreach from=$entries item=v name=entry_loop}}
	{{if $smarty.foreach.entry_loop.first}}
	{{/if}}

	<div class="entry">
		<div class="title">
			<h2>
				<a href="{{url url='admin/view' entry_id=$v->id|eh}}">{{$v->title|eh}}</a>
			</h2>
		</div>
		<div class="created">
			{{$v->created|eh}}
		</div>
		<div class="body">
			{{$v->body|eh|nl2br}}
		</div>
		<div class="postscript">
			{{$v->postscript|eh|nl2br}}
		</div>
		<div class="btn-group">
          <a href="{{url url='admin/edit' entry_id=$v->id|eh}}" class="btn btn-info">Edit this entry</a>
          <a href="{{url url='admin/delete' entry_id=$v->id|eh}}" class="btn btn-danger">Delete this entry</a>
		</div>
	</div>

	{{if $smarty.foreach.entry_loop.last}}
	{{/if}}
{{/foreach}}


