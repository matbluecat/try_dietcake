<h2>{{$entry->title|eh}}</h2>

<p class="alert alert-success">
  You successfully wrote this comment.
</p>

<a href="{{url url='blog/view' entry_id=$entry->id}}">&larr; Back to entry</a>
