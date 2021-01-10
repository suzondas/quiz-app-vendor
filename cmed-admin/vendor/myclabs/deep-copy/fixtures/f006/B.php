<?php

namespace DeepCopy\f006;

class B
{
    public  $cloned = FALSE;
    private $bProp;
    
    public function getBProp()
    {
        return $this->bProp;
    }
    
    public function setBProp( $prop )
    {
        $this->bProp = $prop;
        
        return $this;
    }
    
    public function __clone()
    {
        $this->cloned = TRUE;
    }
}
