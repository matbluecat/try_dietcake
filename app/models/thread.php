<?php
class Thread extends AppModel
{
    public static function get($id)
    {
        $db = DB::conn();
        $row = $db->row('SELECT * FROM thread WHERE id = ?', array($id));
        return new self($row);
    }

    public static function getAll()
    {
        $threads = array();

        $db = DB::conn();
        $rows = $db->rows('SELECT * FROM thread');
        foreach ($rows as $row) {
            $threads[] = new Thread($row);
        }

        return $threads;
    }

    public function getComments()
    {
        $comments = array();

        $db = DB::conn();
        $rows = $db->rows('SELECT * FROM comment WHERE thread_id = ? ORDER BY created ASC', array($this->id));
        foreach ($rows as $row) {
            $comments[] = new Comment($row);
        }

        return $comments;
    }

    public function write(Comment $comment)
    {
        $db = DB::conn();
        $db->query('INSERT INTO comment SET thread_id = ?, username = ?, body = ?, created = NOW()', array($this->id, $comment->username, $comment->body));
    }
}
