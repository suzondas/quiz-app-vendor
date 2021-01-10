<?php

namespace DeepCopy\f005;

class Foo
{
    public $cloned = FALSE;
    
    public function __clone()
    {
        $this->cloned = TRUE;
    }
}
