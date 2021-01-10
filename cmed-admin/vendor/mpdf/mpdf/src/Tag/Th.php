<?php

namespace Mpdf\Tag;

class Th extends Td
{
    
    public function close( &$ahtml, &$ihtml )
    {
        $this->mpdf->SetStyle( 'B', FALSE );
        parent::close( $ahtml, $ihtml );
    }
}
