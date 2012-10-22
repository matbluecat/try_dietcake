<h1>Blog</h1>

{{foreach from=$entries item=v name=entry_loop}}
	{{if $smarty.foreach.entry_loop.first}}
	{{/if}}

	<div class="entry">
		<div class="title">
			<h2>
				<a href="{{url url='blog/view' entry_id=$v->id|eh}}">{{$v->title|eh}}</a>
			</h2>
		</div>
		<div class="created">
			{{$v->created|eh}}
		</div>
		<div class="body">
			{{$v->body|eh}}
		</div>
		<div class="postscript">
			<a href="{{url url='blog/view' entry_id=$v->id|eh}}#postscript">続きを読む</a>
		</div>
	</div>

	{{if $smarty.foreach.entry_loop.last}}
	{{/if}}
{{/foreach}}

<a class="btn btn-large btn-primary" href="{{url url='blog/create'}}">Create new entry</a>
