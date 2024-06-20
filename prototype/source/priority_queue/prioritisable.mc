import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;
using Toybox.Test;


module Jacobs
{
    class Prioritisable
    {
        /**
        *   The Prioritisable class represents an item with a priority value, explicitly defining 
        *   methods for getting and setting the priority value. 
        *   The priority value determines the order in which items are processed in a priority queue.
        */


        // Class Attributes:
        private const _DEFAULT_PRIORITY = 0;

        // Instance Attributes:
        private var _priority as Number = _DEFAULT_PRIORITY;

        // Constructor:
        public function initialize(priority as Number or Null)
        {
            _priority = priority;
            if(_priority == null) { _priority = _DEFAULT_PRIORITY; }
        }

        // Methods:
        public function getPriority() as Number
        {
            /**
            *   Gets the priority of the item.
            *   @return The priority value of the item.
            */


            return _priority;
        }

        public function setPriority(priority as Number) as Void
        {
            /**
            *   Sets the priority of the item.
            *   @param priority The new priority value to be assigned to the item.
            *   @return Void
            */


            Test.assert(priority != null);
            _priority = priority;
        }
    }
}