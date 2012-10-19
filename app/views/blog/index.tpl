<h1>Blog</h1>

<ul>
  {{foreach from=$entries item=v}}
  <li><a href="{{url url='blog/view' entry_id=$v->id|eh}}">{{$v->title}}</a></li>
  {{/foreach}}
</ul>

<a class="btn btn-large btn-primary" href="{{url url='blog/create'}}">Create new entry</a>
