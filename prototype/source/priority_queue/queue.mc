import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;

module Jacobs
{
    class QueueItem
    {
        // Instance Attributes:
        public var mObject as Object;
        public var mPriority as Lang.Number;

        // Constructor:
        public function initialize(pObject as Object, pPriority as Lang.Number)
        {
            mObject = pObject;
            mPriority = pPriority;
        }
    }

    class PriorityQueue
    {
        // Instance Attributes:
        private var _mElements as Array<QueueItem>;

        // Constructor:
        public function initialize()
        {
            _mElements = [];
        }

        // Methods:
        public function enqueue(pObject as Object, pPriority as Lang.Number) as Void
        {
            insert(new QueueItem(pObject, pPriority), getIndex(pPriority, 0, _mElements.size()));
        }

        public function dequeue() as Object or Null
        {
            return 0;
        }

        public function insert(pItem as QueueItem, pPosition as Lang.Number) {
            // Create a new array to hold the result
            var newElements = new [QueueItem];

            // Add elements before the insertion position
            for (var i = 0; i < pPosition; i++) 
            {
                newElements.add(_mElements[i]);
            }

            // Insert the new item
            newElements.add(pItem);

            // Add elements after the insertion position
            for (var i = pPosition; i < _mElements.size(); i++) 
            {
                newElements.add(_mElements[i]);
            }

            // Replace the old array with the new one
            _mElements = newElements;
        }

        public function getIndex(pPriority as Lang.Number, pLow as Lang.Number, pHigh as Lang.Number) as Lang.Number
        {
            while (pHigh > pLow)
            {
                var middle = (pLow + pHigh) / 2;
                
                if (pPriority == _mElements[middle])
                {
                    pLow = middle + 1;
                }

                else if (pPriority > _mElements[middle].mPriority)
                {
                    pLow = middle + 1;
                }
                else
                {
                    pHigh = middle - 1;
                }
            }

            if (pPriority > _mElements[pLow].mPriority)
            {
                return pLow + 1;
            }
            
            return pLow;
        }

        public function sort()
        {
            var i, loc, j, k, selected;

            for(i = 1; i < _mElements.size(); i++)
            {
                j = i - 1;
                selected = _mElements[i];

                // Find location where selected should be inserted.
                loc = getIndex(selected.mPriority, 0, j);

                // Move all elements after location to create space).
                while(j >= loc)
                {
                    _mElements[j+1] = _mElements[j];
                    j--;
                }

                _mElements[j+1] = selected;
            }
        }
    }
}