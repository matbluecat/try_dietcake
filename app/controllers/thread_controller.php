<?php
class ThreadController extends AppController
{
    public function index()
    {
        $threads = Thread::getAll();

        $this->set(get_defined_vars());
    }
}
