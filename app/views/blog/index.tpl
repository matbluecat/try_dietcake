<h1>Blog</h1>

{{foreach from=$entries item=v name=entry_loop}}
	{{if $smarty.foreach.entry_loop.first}}
	{{/if}}

	<div class="entry">
		<div class="title">
			<a href="{{url url='blog/view' entry_id=$v->id|eh}}">{{$v->title}}</a>
		</div>
		<div class="body">
			{{$v->body}}
		</div>
		<div class="postscript">
			<a href="{{url url='blog/view' entry_id=$v->id|eh}}">続きを読む</a>
		</div>
	</div>

	{{if $smarty.foreach.entry_loop.last}}
	{{/if}}
{{/foreach}}

<a class="btn btn-large btn-primary" href="{{url url='blog/create'}}">Create new entry</a>
