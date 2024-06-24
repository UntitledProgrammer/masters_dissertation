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
    class Segment
    {
        /**
        * This class represents a segment of the display that can show a header and a value.
        * It manages the UI components and provides methods to customize and draw them.
        */


        // Class Attributes:
        private const _VALUE_OFFSET as Lang.Number = 20;


        // Instance Attributes:
        private var _header as WatchUi.Text;
        private var _value as WatchUi.Text;


        // Constructor:
        public function initialize(x as Number, y as Number, width as Number, height as Number)
        {
            /**
            * Initializes a Segment object with specified position and dimensions.
            * 
            * @param x      The x-coordinate of the segment's position.
            * @param y      The y-coordinate of the segment's position.
            * @param width  The width of the segment.
            * @param height The height of the segment.
            */


            _header = new WatchUi.Text({
                :text=> "header",
                :color=>Graphics.COLOR_BLACK,
                :font=>Graphics.FONT_LARGE,
                :locX => x + (width/2),
                :locY=> y + (height/4),
                :backgroundColor=>Graphics.COLOR_TRANSPARENT,
                :font=>Graphics.FONT_SMALL,
                :justification=>Graphics.TEXT_JUSTIFY_CENTER
            });

            _value = new WatchUi.Text({
                :text=> "value",
                :color=>Graphics.COLOR_BLACK,
                :font=>Graphics.FONT_LARGE,
                :locX => x + (width/2),
                :locY=> y + _VALUE_OFFSET + (height/4),
                :backgroundColor=>Graphics.COLOR_TRANSPARENT,
                :justification=>Graphics.TEXT_JUSTIFY_CENTER
            });
        }


        // Methods:
        public function setFont(font as Graphics.FontType)
        {
            /**
            * Sets the font of the header text.
            * 
            * @param font The font to be set for the header text.
            */


            _header.setFont(font);
        }

        public function draw(header as String, value as Number, dc as Dc)
        {
            /**
            * Draws the segment with the specified header and value.
            * 
            * @param header The text to be displayed as the header.
            * @param value  The numerical value to be displayed.
            * @param dc     The device context used for drawing.
            */


            // Set the UI values.
            _header.setText(header);
            _value.setText(value.format("%i"));

            // Draw the UI.
            _header.draw(dc);
            _value.draw(dc);
        }
    }
}