<?php

namespace DeepCopy\Filter;

use DeepCopy\Reflection\ReflectionHelper;

/**
 * @final
 */
class SetNullFilter implements Filter
{
    /**
     * Sets the object property to null.
     *
     * {@inheritdoc}
     */
    public function apply( $object, $property, $objectCopier )
    {
        $reflectionProperty = ReflectionHelper::getProperty( $object, $property );
        
        $reflectionProperty->setAccessible( TRUE );
        $reflectionProperty->setValue( $object, NULL );
    }
}
