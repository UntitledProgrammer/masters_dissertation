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
    class PriorityQueue
    {
        /*
        *   The PriorityQueue class manages a collection of 'Prioritisable' items, maintaining their order based on priority. 
        *   The class defines methods for adding (enqueue) items, retrieving (dequeue) the highest priority item, and updating the priority of existing items. 
        *   Crucially, the queue ensures that items with higher priority are processed before those with lower priority.
        */

        
        // Class Attributes:
        private const _STARTING_INDEX as Lang.Number = 0;
        private const _OUT_OF_RANGE as Lang.Number = -1;


        // Instance Attributes:
        private var _mElements as Array<Prioritisable>;


        // Constructor:
        public function initialize()
        {
            _mElements = [];
        }


        // Methods:
        public function enqueue(item as Prioritisable) as Void
        {
            /**
            *   Adds an element to the priority queue at the correct position based on its priority.
            *   @param element The element to be added to the priority queue.
            */

            
            var position = findInsertPosition(item);
            insertAtPosition(item, position);
        }

        public function dequeue() as Object or Null
        {
            /**
            *   Removes and returns the element with the highest priority from the queue.
            *   @return The element with the highest priority, or null if the queue is empty.
            */


            if (_mElements.size() == 0) 
            {
                // If the queue is empty then return null.
                return null;
            }

            // Copy and remove the element with the highest priority from the queue.
            var object = _mElements[_STARTING_INDEX];
            _mElements.remove(_mElements[_STARTING_INDEX]);

            return object;
        }

        public function updatePriority(item as Prioritisable, newPriority as Number) as Void
        {
            /** 
            *   Updates the priority of an existing item in the queue.
            *   @param item The item whose priority is to be updated.
            *   @param newPriority The new priority value to be assigned to the item.
            */


            // Check if the item is contained within the queue.
            var index = _mElements.indexOf(item);

            if (index != _OUT_OF_RANGE)
            {
                // If the item is contained within the queue then update the priority.
                _mElements.remove(item);
                item.setPriority(newPriority);
                enqueue(item);
            }
        }

        private function findInsertPosition(item as Prioritisable) as Number 
        {
            /**
            *   Finds the correct position to insert a new item in the queue based on its priority.
            *   @param item The item to be inserted.
            *   @return The index at which the item should be inserted.
            */


            var low = 0;
            var high = _mElements.size() - 1;

            while (low <= high) 
            {
                var mid = (low + high) / 2;
                if (_mElements[mid].getPriority() < item.getPriority()) 
                {
                    high = mid - 1;
                } 
                else 
                {
                    low = mid + 1;
                }
            }

            return low;
        }

        private function insertAtPosition(item as Prioritisable, position as Number)  as Void
        {
            /** 
            *   Inserts an item at the specified position in the queue.
            *   @param item The item to be inserted.
            *   @param position The index at which the item should be inserted.
            */


            var newElements = new Array<Prioritisable>[0];

            for (var i = 0; i < position; i++) 
            {
                newElements.add(_mElements[i]);
            }

            newElements.add(item);

            for (var i = position; i < _mElements.size(); i++) 
            {
                newElements.add(_mElements[i]);
            }

            _mElements = newElements;
        }
    }
}