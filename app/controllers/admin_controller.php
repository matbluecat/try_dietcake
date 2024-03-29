<?php
class AdminController extends AppController
{
	private function isLogin(){
		try{
			$admin = Admin::getLogin();
			return $admin;
		}catch(AdminLoginException $e){
			$page = 'login';
			$this->render($page);
		}
	}

	public function logout(){
		$admin = $this->isLogin();
		Admin::logout();
		$page = 'login';
		$this->render($page);
	}

	public function login(){
		$page = Param::get('page_next', 'login');

		switch($page){
			case 'login';
				try{
					$admin = $this->isLogin();
					$this->redirect('admin/index');
				}catch(AdminLoginException $e){
					$page = 'login';
				}

				break;
			case 'login_end':
				try{
					$admin = Admin::certificate(Param::get('admin_id'), Param::get('pass'));
					$entries = Entry::getAll();
					$this->redirect('admin/index');
				}catch(AdminLoginException $e){
					$page = 'login';
				}
				break;
			default:
				throw new NotFoundException("{$page} is not found");
				break;
		}
		$this->set(get_defined_vars());
		$this->render($page);
	}

	// 管理者用TOP
	public function index(){
		$admin = $this->isLogin();
		$entries = Entry::getAll();
		$this->set(get_defined_vars());
	}

	// 新規記事作成
	public function create(){
		$admin = $this->isLogin();
		$entry = new Entry();
		$page = Param::get('page_next', 'create');

		switch($page){
			case 'create':
				break;
			case 'create_end':
				$entry->title = Param::get('title');
				$entry->body = Param::get('body');
				$entry->postscript = Param::get('postscript');
				try{
					$entry->create();
				}catch(ValidationException $e){
					$page = 'create';
				}
				break;
			default:
				throw new NotFoundException("{$page} is not found");
				break;
		}

		$this->set(get_defined_vars());
		$this->render($page);
	}

	// 記事1件見る
	public function view(){
		$admin = $this->isLogin();
		$entry = Entry::get(Param::get('entry_id'));
		$blog_comments = $entry->getComments();
		$this->set(get_defined_vars());
	}

	// 記事の削除
	public function delete(){
		$admin = $this->isLogin();
		$entry = Entry::get(Param::get('entry_id'));
		$blog_comments = $entry->getComments();
		$page = Param::get('page_next', 'delete');

		switch($page){
			case 'delete':
				break;
			case 'delete_end':
				try{
					$entry->delete(Param::get('entry_id'));
				}catch(ValidationException $e){
					$page = 'view';
				}
				break;
			default:
				throw new NotFoundException("{$page} is not found");
				break;
		}
		$this->set(get_defined_vars());
		$this->render($page);
	}

	// 記事へのコメント
	public function comment_write(){
		$admin = $this->isLogin();
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

	// 記事の編集
	public function edit(){
		$admin = $this->isLogin();
		$page = Param::get('page_next', 'edit');

		switch($page){
			case 'edit':
				$entry = Entry::get(Param::get('entry_id'));
				break;
			case 'edit_end':
				$entry = Entry::get(Param::get('entry_id'));
				$entry->title = Param::get('title');
				$entry->body = Param::get('body');
				$entry->postscript = Param::get('postscript');
				try{
					$entry->update();
				}catch(ValidationException $e){
					$page = 'edit';
				}
				break;
			default:
				throw new NotFoundException("{$page} is not found");
				break;
		}

		$this->set(get_defined_vars());
		$this->render($page);
	}

}
