<?php
class Entry extends AppModel
{
    public $validation = array(
        'title' => array(
            'length' => array(
                'validate_between', 1, 30,
            ),
        ),
    );

    public static function get($id)
    {
        $db = DB::conn();
        $row = $db->row('SELECT * FROM entry WHERE id = ?', array($id));
        return new self($row);
    }
    public static function getAll()
    {
        $entries = array();

        $db = DB::conn();
        $rows = $db->rows('SELECT * FROM entry ORDER BY created DESC');
        foreach ($rows as $row) {
            $entries[] = new Entry($row);
        }

        return $entries;
    }

	public function create()
	{
		$this->validate();
		if($this->hasError()){
			throw new ValidationException('invalid entry');
		}

		$db = DB::conn();
		$db->begin();
		$db->query('INSERT INTO entry SET title = ?, body = ?, postscript = ?, created = NOW(), updated = NOW()', array(
			$this->title,
			$this->body,
			$this->postscript,
		));
		$this->id = $db->lastInsertId();
		$db->commit();
	}

	public function update()
	{
		$this->validate();
		if($this->hasError()){
			throw new ValidationException('invalid entry');
		}

		$db = DB::conn();
		$db->begin();
		$db->query('UPDATE entry SET title = ?, body = ?, postscript = ?, updated = NOW() WHERE id = ?', array(
			$this->title,
			$this->body,
			$this->postscript,
			$this->id,
		));
		$db->commit();
	}

	public function delete($id){
        $db = DB::conn();
		$db->begin();
        $db->query('DELETE FROM entry WHERE id = ?', array($id));
        $db->query('DELETE FROM blog_comment WHERE entry_id = ?', array($id));
		$db->commit();
	}

	public function getComments()
	{
		$blog_comments = array();
		$db = DB::conn();
		$rows = $db->rows("SELECT * FROM blog_comment WHERE entry_id = ?", array($this->id));
		foreach($rows as $row){
			$blog_comments[] = new BlogComment($row);
		}

		return $blog_comments;
	}

	public function writeComment(BlogComment $blog_comment){
		$blog_comment->validate();
		if($blog_comment->hasError()){
			throw new ValidationException('invalid blog_comment');
		}
		$db = DB::conn();
		$db->query('INSERT INTO blog_comment SET entry_id = ?, username= ?, body = ?, created = NOW()', array(
			$this->id,
			$blog_comment->username,
			$blog_comment->body,
		));
	}


}
