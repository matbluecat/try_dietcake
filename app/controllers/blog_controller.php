<?php
class BlogController extends AppController
{
	public $default_view_class = 'AppSmartyView';

	public function index(){
		$entries = Entry::getAll();
		$this->set(get_defined_vars());
	}

	// 記事1件見る
	public function view(){
		$entry = Entry::get(Param::get('entry_id'));
		$blog_comments = $entry->getComments();
		$this->set(get_defined_vars());
	}

	// 記事へのコメント
	public function comment_write(){
		$page = Param::get('page_next', 'comment_write');
		$entry = Entry::get(Param::get('entry_id'));
		$blog_comment = new BlogComment();

		switch($page){
			case 'comment_write':
				$page = 'view';
				break;
			case 'comment_write_end':
				$blog_comment->username = Param::get('username');
				$blog_comment->body = Param::get('body');
				try{
					$entry->writeComment($blog_comment);
				}catch(ValidationException $e){
					$page = 'view';
				}
				break;
			default:
				throw new NotFoundException("{$page} is not found");
				break;
		}
		$blog_comments = $entry->getComments();

		$this->set(get_defined_vars());
		$this->render($page);
	}

}
