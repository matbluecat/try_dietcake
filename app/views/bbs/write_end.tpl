<h2>{{$thread->title|eh}}</h2>

<p class="alert alert-success">
  You successfully wrote this comment.
</p>

<a href="{{smarty_url url='bbs/view' thread_id=$thread->id}}">&larr; Back to thread</a>
