<?php

namespace Mpdf;

class Hyphenator
{
    
    /**
     * @var \Mpdf\Mpdf
     */
    private $mpdf;
    
    private $SHYpatterns;
    
    private $SHYdictionary;
    
    private $SHYdictionaryWords;
    
    private $loadedSHYpatterns;
    
    private $loadedSHYdictionary;
    
    public function __construct( Mpdf $mpdf )
    {
        $this->mpdf = $mpdf;
        
        $this->loadedSHYdictionary = FALSE;
        
        $this->SHYpatterns        = [];
        $this->SHYdictionary      = [];
        $this->SHYdictionaryWords = [];
    }
    
    /**
     * @param $word
     * @param $currptr
     *
     * @return int
     */
    function hyphenateWord( $word, $currptr )
    {
        // Do everything inside this function in utf-8
        // Don't hyphenate web addresses
        if ( preg_match( '/^(http:|www\.)/', $word ) ) {
            return -1;
        }
        
        $ptr = -1;
        
        if ( !$this->loadedSHYdictionary ) {
            $this->loadDictionary();
        }
        
        if ( !in_array( $this->mpdf->SHYlang, $this->mpdf->SHYlanguages ) ) {
            return -1;
        }
        
        // If no pattern loaded or not the best one
        if ( !$this->patternsLoaded() ) {
            $this->loadPatterns();
        }
        
        if ( $this->mpdf->usingCoreFont ) {
            $word = mb_convert_encoding( $word, 'UTF-8', $this->mpdf->mb_enc );
        }
        
        $prepre           = '';
        $postpost         = '';
        $startpunctuation = "\xc2\xab\xc2\xbf\xe2\x80\x98\xe2\x80\x9b\xe2\x80\x9c\xe2\x80\x9f";
        $endpunctuation   = "\xe2\x80\x9e\xe2\x80\x9d\xe2\x80\x9a\xe2\x80\x99\xc2\xbb";
        
        if ( preg_match( '/^(["\'' . $startpunctuation . '])+(.{' . $this->mpdf->SHYcharmin . ',})$/u', $word, $m ) ) {
            $prepre = $m[1];
            $word   = $m[2];
        }
        
        if ( preg_match( '/^(.{' . $this->mpdf->SHYcharmin . ',})([\'\.,;:!?"' . $endpunctuation . ']+)$/u', $word, $m ) ) {
            $word     = $m[1];
            $postpost = $m[2];
        }
        
        if ( mb_strlen( $word, 'UTF-8' ) < $this->mpdf->SHYcharmin ) {
            return -1;
        }
        
        $success   = FALSE;
        $preprelen = mb_strlen( $prepre );
        
        if ( isset( $this->SHYdictionaryWords[mb_strtolower( $word )] ) ) {
            foreach ( $this->SHYdictionaryWords[mb_strtolower( $word )] as $i ) {
                if ( ( $i + $preprelen ) >= $currptr ) {
                    break;
                }
                
                $ptr     = $i + $preprelen;
                $success = TRUE;
            }
        }
        
        if ( !$success ) {
            $text_word       = '_' . $word . '_';
            $word_length     = mb_strlen( $text_word, 'UTF-8' );
            $text_word       = mb_strtolower( $text_word, 'UTF-8' );
            $hyphenated_word = [];
            
            $numbers = [
                '0' => TRUE,
                '1' => TRUE,
                '2' => TRUE,
                '3' => TRUE,
                '4' => TRUE,
                '5' => TRUE,
                '6' => TRUE,
                '7' => TRUE,
                '8' => TRUE,
                '9' => TRUE
            ];
            
            for ( $position = 0; $position <= ( $word_length - $this->mpdf->SHYcharmin ); $position++ ) {
                $maxwins = min( ( $word_length - $position ), $this->mpdf->SHYcharmax );
                for ( $win = $this->mpdf->SHYcharmin; $win <= $maxwins; $win++ ) {
                    if ( isset( $this->SHYpatterns[mb_substr( $text_word, $position, $win, 'UTF-8' )] ) ) {
                        $pattern        = $this->SHYpatterns[mb_substr( $text_word, $position, $win, 'UTF-8' )];
                        $digits         = 1;
                        $pattern_length = mb_strlen( $pattern, 'UTF-8' );
                        
                        for ( $i = 0; $i < $pattern_length; $i++ ) {
                            $char = $pattern[$i];
                            if ( isset( $numbers[$char] ) ) {
                                $zero = ( $i == 0 ) ? $position - 1 : $position + $i - $digits;
                                if ( !isset( $hyphenated_word[$zero] ) || $hyphenated_word[$zero] != $char ) {
                                    $hyphenated_word[$zero] = $char;
                                }
                                $digits++;
                            }
                        }
                    }
                }
            }
            
            for ( $i = $this->mpdf->SHYleftmin; $i <= ( mb_strlen( $word, 'UTF-8' ) - $this->mpdf->SHYrightmin ); $i++ ) {
                if ( isset( $hyphenated_word[$i] ) && $hyphenated_word[$i] % 2 != 0 ) {
                    if ( ( $i + $preprelen ) > $currptr ) {
                        break;
                    }
                    $ptr = $i + $preprelen;
                }
            }
        }
        
        return $ptr;
    }
    
    private function loadDictionary()
    {
        if ( file_exists( $this->mpdf->hyphenationDictionaryFile ) ) {
            $this->SHYdictionary = file( $this->mpdf->hyphenationDictionaryFile, FILE_SKIP_EMPTY_LINES );
            foreach ( $this->SHYdictionary as $entry ) {
                $entry  = trim( $entry );
                $poss   = [];
                $offset = 0;
                $p      = TRUE;
                $wl     = mb_strlen( $entry, 'UTF-8' );
                while ( $offset < $wl ) {
                    $p = mb_strpos( $entry, '/', $offset, 'UTF-8' );
                    if ( $p !== FALSE ) {
                        $poss[] = $p - count( $poss );
                    } else {
                        break;
                    }
                    $offset = $p + 1;
                }
                if ( count( $poss ) ) {
                    $this->SHYdictionaryWords[str_replace( '/', '', mb_strtolower( $entry ) )] = $poss;
                }
            }
        } elseif ( $this->mpdf->debug ) {
            throw new \Mpdf\MpdfException( sprintf( 'Unable to open hyphenation dictionary "%s"', $this->mpdf->hyphenationDictionaryFile ) );
        }
        
        $this->loadedSHYdictionary = TRUE;
    }
    
    private function patternsLoaded()
    {
        return !( count( $this->SHYpatterns ) < 1 || ( $this->loadedSHYpatterns && $this->loadedSHYpatterns != $this->mpdf->SHYlang ) );
    }
    
    private function loadPatterns()
    {
        $patterns = require __DIR__ . '/../data/patterns/' . $this->mpdf->SHYlang . '.php';
        $patterns = explode( ' ', $patterns );
        
        $new_patterns = [];
        for ( $i = 0; $i < count( $patterns ); $i++ ) {
            $value                                               = $patterns[$i];
            $new_patterns[preg_replace( '/[0-9]/', '', $value )] = $value;
        }
        
        $this->SHYpatterns       = $new_patterns;
        $this->loadedSHYpatterns = $this->mpdf->SHYlang;
    }
}
