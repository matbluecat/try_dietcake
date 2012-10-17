<h1>All threads</h1>

<ul>
  {{foreach from=$threads item=v}}
  <li><a href="{{url url='bbs/view' thread_id=$v->id|eh}}">{{$v->title}}</a></li>
  {{/foreach}}
</ul>

<a class="btn btn-large btn-primary" href="bbs/create">Create</a>
