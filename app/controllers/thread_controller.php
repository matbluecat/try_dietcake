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

        $this->set(get_defined_vars());
    }
}
