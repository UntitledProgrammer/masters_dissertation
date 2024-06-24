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
        /**
        * This class represents a message with a header, value, and colour.
        */


        // Instance Attributes:
        public var header as String = "";
        public var value as Number = 0;
        public var colour as Number = 0;


        // Constructor:
        public function initialize(header as String, value as Number, colour as Number)
        {
            /**
            * Initializes a Message object with specified header, value, and colour.
            * 
            * @param header The header text of the message.
            * @param value  The numerical value of the message.
            * @param colour The colour of the message text.
            */


            self.header = header;
            self.value = value;
            self.colour = colour;
        }
    }
}