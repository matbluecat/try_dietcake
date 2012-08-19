<?php
class ThreadController extends AppController
{
    public function index()
    {
        $threads = Thread::getAll();

        $this->set(get_defined_vars());
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
        $page = Param::get('page_next');

        switch ($page) {
        case 'write_end':
            $params = array(
                'username' => Param::get('username'),
                'body' => Param::get('body'),
            );
            $comment = new Comment($params);
            $thread->write($comment);
            break;
        default:
            throw new NotFoundException("{$page} is not found");
            break;
        }

        $this->set(get_defined_vars());
        $this->render($page);
    }
}
