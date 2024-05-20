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
    class Layer
    {
        // Instance Attributes:
        var mNeurons;

        // Initiliser:
        function initialize(pNeurons as Array<Neuron>)
        {
            mNeurons = pNeurons;
        }
    }
}