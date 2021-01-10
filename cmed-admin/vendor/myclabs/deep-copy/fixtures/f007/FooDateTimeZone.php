<?php

namespace DeepCopy\f007;

use DateTimeZone;

class FooDateTimeZone extends DateTimeZone
{
    public $cloned = FALSE;
    
    public function __clone()
    {
        $this->cloned = TRUE;
    }
}
