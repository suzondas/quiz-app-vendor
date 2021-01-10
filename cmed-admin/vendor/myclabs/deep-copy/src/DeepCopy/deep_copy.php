<?php

namespace DeepCopy;

/**
 * Deep copies the given value.
 *
 * @param mixed $value
 * @param bool  $useCloneMethod
 *
 * @return mixed
 */
function deep_copy( $value, $useCloneMethod = FALSE )
{
    return ( new DeepCopy( $useCloneMethod ) )->copy( $value );
}
