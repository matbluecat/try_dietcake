<h1><?php eh($thread->title) ?></h1>

<?php foreach ($comments as $k => $v): ?>
<div class="comment">
  <div class="meta">
    <?php eh($k + 1) ?>: <?php eh($v->username) ?> <?php eh($v->created) ?>
  </div>
  <div>
    <?php eh($v->body) ?>
  </div>
</div>
<?php endforeach ?>
