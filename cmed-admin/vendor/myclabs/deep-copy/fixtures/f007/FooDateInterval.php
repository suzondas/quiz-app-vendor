<?php

namespace DeepCopy\f007;

use DateInterval;

class FooDateInterval extends DateInterval
{
    public $cloned = FALSE;
    
    public function __clone()
    {
        $this->cloned = TRUE;
    }
}
