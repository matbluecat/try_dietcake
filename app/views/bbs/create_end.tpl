<h2>{{$thread->title|eh}}</h2>

<p class="alert alert-success">
  You successfully created.
</p>

<a href="{{url url='bbs/view' thread_id=$thread->id|eh}}">&larr; Go to thread</a>
