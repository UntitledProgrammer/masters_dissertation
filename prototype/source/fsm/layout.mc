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
    class Message
    {
        // Instance Attributes:
        public var header as String = "";
        public var value as Number = 0;
        public var colour as Number = 0;


        // Constructor:
        public function initialize(header as String, value as Number, colour as Number)
        {
            self.header = header;
            self.value = value;
            self.colour = colour;
        }
    }


    class Segment
    {
        // Instance Attributes:
        private var _header as WatchUi.Text;
        private var _value as WatchUi.Text;


        // Constructor:
        public function initialize(x as Number, y as Number)
        {
            _header = new WatchUi.Text({
                :text=> "header",
                :color=>Graphics.COLOR_BLACK,
                :font=>Graphics.FONT_LARGE,
                :locX => x,
                :locY=>y
            });

            _value = new WatchUi.Text({
                :text=> "value",
                :color=>Graphics.COLOR_BLACK,
                :font=>Graphics.FONT_LARGE,
                :locX => x,
                :locY=> y + 20
            });
        }


        // Methods:
        public function draw(header as String, value as Number, dc as Dc)
        {
            // Set the UI values.
            _header.setText(header);
            _value.setText(value.format("%o"));

            // Draw the UI.
            _header.draw(dc);
            _value.draw(dc);
        }
    }


    class LayoutOrchestrator
    {
        // Class Attributes:
        private const _MAXIMUM_MESSAGES = 4;
        private const _MESSAGES_PER_ROW = 2;


        // Instance Attributes:
        private var headerLabel as WatchUi.Text;
        private var _segments as Array<Segment> = new Array<Segment>[0];


        // Constructor:
        public function initialize()
        {
            headerLabel = new WatchUi.Text({
                :text=> "test",
                :color=>Graphics.COLOR_BLACK,
                :font=>Graphics.FONT_LARGE,
                :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
                :locY=>WatchUi.LAYOUT_VALIGN_CENTER
            });
        }


        // Methods:
        public function draw(messages as Array<Message>, dc as Dc) as Void
        {
            headerLabel.draw(dc);

            for(var i = 0; i < messages.size() && i < _MAXIMUM_MESSAGES; i++)
            {
                if(i < _segments.size())
                {
                    _segments[i].draw("header", 152, dc);
                }


                _segments.add(new Segment(0,0));
                _segments[i].draw("header", 152, dc);
            }
        }

        private function _drawSegment(message as Message) as Void
        {

        }
    }
}

