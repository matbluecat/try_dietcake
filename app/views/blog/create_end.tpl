<h2>{{$entry->title|eh}}</h2>

<p class="alert alert-success">
  You successfully created.
</p>

<a href="{{url url='blog/view' entry_id=$entry->id|eh}}">&larr; Go to entry</a>
