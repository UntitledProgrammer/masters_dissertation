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
        // Class Attributes:
        private const _VALUE_OFFSET as Lang.Number = 20;


        // Instance Attributes:
        private var _header as WatchUi.Text;
        private var _value as WatchUi.Text;


        // Constructor:
        public function initialize(x as Number, y as Number, width as Number, height as Number)
        {
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
            _header.setFont(font);
        }

        public function draw(header as String, value as Number, dc as Dc)
        {
            // Set the UI values.
            _header.setText(header);
            _value.setText(value.format("%i"));

            // Draw the UI.
            _header.draw(dc);
            _value.draw(dc);
        }
    }
}