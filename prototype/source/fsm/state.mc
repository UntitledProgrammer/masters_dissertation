import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

using Toybox.Graphics as Graphics;
using Toybox.Lang as Lang;
using Toybox.System as Sys;
using Toybox.WatchUi as WatchUi;

module Jacobs
{
    class LayoutState 
    {
        /**
        * This class serves as a base class for different layout states. It manages a collection of
        * Segment objects and provides a method to draw these segments on the display.
        */


        // Instance Attributes:
        protected var _segments as Array<Segment> = new Array<Segment>[0];


        // Methods:
        public function draw(dc as Dc, messages as Array<Message>, context as LayoutOrchestrator) as Void
        {
            /**
            * Draws the segments on the display.
            * 
            * @param dc       The device context used for drawing.
            * @param messages An array of Message objects, each containing header, value, and colour.
            * @param context  The LayoutOrchestrator context that manages the state transitions.
            * @return Void
            */


            for (var i = 0; i < _segments.size(); i++) 
            {
                _segments[i].draw(messages[i].header, messages[i].value, dc);
            }
        }
    }


    class ZeroMessagesState extends LayoutState 
    {
        public function draw(dc as Dc, messages as Array<Message>, context as LayoutOrchestrator) as Void 
        {
            // Handle zero messages (e.g., show a default message or do nothing)
        }
    }


    class OneMessageState extends LayoutState 
    {
        // Constructor:
        public function initialize()
        {
            LayoutState.initialize();
            _segments.add(new Segment(0, 0, ForerunnerXT.DISPLAY_WIDTH, ForerunnerXT.DISPLAY_HEIGHT));
            _segments[_segments.size()-1].setFont(Graphics.FONT_LARGE);
        }
    }

    class TwoMessagesState extends LayoutState 
    {
        // Constructor:
        public function initialize()
        {
            LayoutState.initialize();

            var segmentHeight = ForerunnerXT.DISPLAY_HEIGHT / 2;

            for (var i = 0; i < 2; i++) 
            {
                var yPosition = i * segmentHeight;
                _segments.add(new Segment(0, yPosition, ForerunnerXT.DISPLAY_WIDTH, segmentHeight));
            }
        }
    }


    class ThreeMessagesState extends LayoutState 
    {
        // Constructor:
        public function initialize()
        {
            LayoutState.initialize();

            var segmentHeight = ForerunnerXT.DISPLAY_HEIGHT / 3;

            for (var i = 0; i < 3; i++) 
            {
                var yPosition = i * segmentHeight;
                _segments.add(new Segment(0, yPosition, ForerunnerXT.DISPLAY_WIDTH, segmentHeight));
            }
        }
    }


    class FourMessagesState extends LayoutState 
    {
        // Constructor:
        public function initialize()
        {
            LayoutState.initialize();

            var segmentHeight = ForerunnerXT.DISPLAY_HEIGHT / 4;

            for (var i = 0; i < 4; i++) {
                var yPosition = i * segmentHeight;
                _segments.add(new Segment(0, yPosition, ForerunnerXT.DISPLAY_WIDTH, segmentHeight));
            }
        }
    }
}