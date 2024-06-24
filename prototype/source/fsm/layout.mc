import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;


module ForerunnerXT
{
    public const DISPLAY_WIDTH as Lang.Number = 205;
    public const DISPLAY_HEIGHT as Lang.Number = 148;
    public const SEGEMENTS_PER_ROW as Lang.Number = 2;
    public const SEGMENT_WIDTH as Lang.Number = DISPLAY_WIDTH / SEGEMENTS_PER_ROW;
    public const SEGMENT_HEIGHT as Lang.Number = DISPLAY_HEIGHT / SEGEMENTS_PER_ROW;
}


module Jacobs
{
    enum LayoutStateEnum
    {
        ZERO_MESSAGES,
        ONE_MESSAGE,
        TWO_MESSAGES,
        THREE_MESSAGES,
        FOUR_MESSAGES
    }


    class LayoutOrchestrator
    {
        /**
        * This class orchestrates the layout of the display based on the number of messages.
        * It manages different layout states and transitions between them.
        */


        // Instance Attributes:
        private var _state as LayoutStateEnum;
        private var _zeroMessagesState as LayoutState;
        private var _oneMessageState as LayoutState;
        private var _twoMessagesState as LayoutState;
        private var _threeMessagesState as LayoutState;
        private var _fourMessagesState as LayoutState;


        // Constructor:
        public function initialize() 
        {
            _zeroMessagesState = new ZeroMessagesState();
            _oneMessageState = new OneMessageState();
            _twoMessagesState = new TwoMessagesState();
            _threeMessagesState = new ThreeMessagesState();
            _fourMessagesState = new FourMessagesState();
            _state = ZERO_MESSAGES;
        }


        // Methods:
        public function draw(messages as Array<Message>, dc as Dc) as Void 
        {
            /**
            * Draws the display based on the current state and number of messages.
            * 
            * @param messages An array of Message objects to be displayed.
            * @param dc       The device context used for drawing.
            * @return Void
            */
            switch (messages.size()) {
                case 0:
                    _state = ZERO_MESSAGES;
                    break;
                case 1:
                    _state = ONE_MESSAGE;
                    break;
                case 2:
                    _state = TWO_MESSAGES;
                    break;
                case 3:
                    _state = THREE_MESSAGES;
                    break;
                case 4:
                    _state = FOUR_MESSAGES;
                    break;
                default:
                    _state = FOUR_MESSAGES;
                    break;
            }

            dc.clear();

            switch (_state) {
                case ZERO_MESSAGES:
                    _zeroMessagesState.draw(dc, messages, self);
                    break;
                case ONE_MESSAGE:
                    _oneMessageState.draw(dc, messages, self);
                    break;
                case TWO_MESSAGES:
                    _twoMessagesState.draw(dc, messages, self);
                    break;
                case THREE_MESSAGES:
                    _threeMessagesState.draw(dc, messages, self);
                    break;
                case FOUR_MESSAGES:
                    _fourMessagesState.draw(dc, messages, self);
                    break;
            }
        }
    }
}

