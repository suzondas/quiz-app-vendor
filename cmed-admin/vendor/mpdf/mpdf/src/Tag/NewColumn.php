<?php

namespace Mpdf\Tag;

class NewColumn extends Tag
{
    
    public function open( $attr, &$ahtml, &$ihtml )
    {
        $this->mpdf->ignorefollowingspaces = TRUE;
        $this->mpdf->NewColumn();
        $this->mpdf->ColumnAdjust = FALSE; // disables all column height adjustment for the page.
    }
    
    public function close( &$ahtml, &$ihtml )
    {
    }
}
