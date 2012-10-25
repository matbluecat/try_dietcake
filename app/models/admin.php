<?php
class Admin extends AppModel
{
	public static function getLogin(){
		$db = DB::conn();
		$row = $db->row('SELECT * FROM admin WHERE id = ?', array(
			Session::get('login_admin_id'),
		));
		if($row===false){
			throw new AdminLoginException('admin not found');
		}else{
			return new self($row);
		}
	}

	public static function certificate($admin_id, $pass){
		$db = DB::conn();
		$row = $db->row('SELECT * FROM admin WHERE admin_id = ? AND pass = ? ', array(
			$admin_id,
			sha1($pass),
		));
		if($row===false){
			throw new AdminLoginException('admin not found');
		}else{
			Session::set('login_admin_id', $row['id']);
			return new self($row);
		}
	}

	public static function logout(){
		Session::delete('login_admin_id');
	}

	public function isLogin(){
		return (is_null($this->id)) ? false : true;
	}
}
