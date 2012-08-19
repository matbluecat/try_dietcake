<?php
class ThreadController extends AppController
{
    public function index()
    {
        $threads = Thread::getAll();

        $this->set(get_defined_vars());
    }

    public function create()
    {
        $page = Param::get('page_next', 'create');

        switch ($page) {
        case 'create':
            $thread = new Thread;
            $comment = new Comment;
            break;
        case 'create_end':
            $thread = new Thread(array('title' => Param::get('title')));
            $params = array(
                'username' => Param::get('username'),
                'body' => Param::get('body'),
            );
            $comment = new Comment($params);
            try {
                $thread->create($comment);
            } catch (ValidationException $e) {
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

    public function view()
    {
        $thread_id = Param::get('thread_id');
        $thread = Thread::get($thread_id);
        $comments = $thread->getComments();

        $this->set(get_defined_vars());
    }

    public function write()
    {
        $thread = Thread::get(Param::get('thread_id'));
        $page = Param::get('page_next', 'write');

        switch ($page) {
        case 'write':
            $comment = new Comment;
            break;
        case 'write_end':
            $params = array(
                'username' => Param::get('username'),
                'body' => Param::get('body'),
            );
            $comment = new Comment($params);
            try {
                $thread->write($comment);
            } catch (ValidationException $e) {
                $page = 'write';
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
