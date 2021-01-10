<?php

namespace DeepCopy\f006;

class A
{
    public  $cloned = FALSE;
    private $aProp;
    
    public function getAProp()
    {
        return $this->aProp;
    }
    
    public function setAProp( $prop )
    {
        $this->aProp = $prop;
        
        return $this;
    }
    
    public function __clone()
    {
        $this->cloned = TRUE;
    }
}
