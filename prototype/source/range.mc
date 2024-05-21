import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;


module Jacobs
{
    class Range
    {
        /**
        *   The Range class represents a range of numbers defined by a minimum and maximum value.
        *   It provides methods to check if a given value falls within the range and to update the range limits.
        */


        // Instance Attributes:
        private var _mMinimum as Lang.Number = 0;
        private var _mMaximum as Lang.Number = 1;


        // Constructor:
        public function initialize(pMinimum as Lang.Number, pMaximum as Lang.Number)
        {
            /**
            *   Constructor to initialize the range with specified minimum and maximum values.
            * 
            *   If the provided minimum is greater than or equal to the maximum, the values are swapped.
            * 
            *   @param pMinimum the minimum value of the range.
            *   @param pMaximum the maximum value of the range.
            */

            if(pMinimum >= pMaximum) 
            {
                // Swap the minimum and maximum values if the minimum is greater than or equal to the maximum.
                _mMinimum = pMaximum;
                _mMaximum = pMinimum;
                return;
            }

            _mMinimum = pMinimum;
            _mMaximum = pMaximum;
        }


        // Methods:
        public function test(pValue as Lang.Number) as Lang.Boolean
        {
            /**
            *   Method to test if a given value falls within the range.
            * 
            *   @param pValue the value to test.
            *   @return true if the value falls within the range, false otherwise.
            */
            
            // Check if the value is within the range bounds.
            return pValue >= _mMinimum && pValue <= _mMaximum;
        }

        public function set_minimum(pValue as Lang.Number) as Void
        {
            /**
            *   Method to set the minimum value of the range.
            * 
            *   If the provided value is greater than or equal to the current maximum value, 
            *   the maximum value is updated to match the new minimum value.
            * 
            *   @param pValue the new minimum value.
            */

            if(pValue >= _mMaximum) 
            { 
                // Update the maximum value to match the new minimum value.
                _mMaximum = pValue;
                return;
            }

            _mMinimum = pValue;
        }

        public function set_maximum(pValue as Lang.Number) as Void
        {
            /**
            *   Method to set the maximum value of the range.
            * 
            *   If the provided value is less than or equal to the current minimum value, 
            *   the minimum value is updated to match the new maximum value.
            * 
            *   @param pValue the new maximum value.
            */

            if(pValue <= _mMinimum) 
            { 
                // Update the minimum value to match the new maximum value.
                _mMinimum = pValue;
                return;
            }

            _mMaximum = pValue;
        }
    }
}