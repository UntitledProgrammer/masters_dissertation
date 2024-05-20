
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
        var mNeurons as Array<Neuron>;

        // Constructor:
        function initialize(pNumberOfNeurons as Lang.Integer, pNumberOfInputsPerNeuron as Lang.Integer)
        {
            mNeurons = [];
            for (var i = 0; i < pNumberOfNeurons-1; i++)
            {
                mNeurons.add(new Neuron(pNumberOfInputsPerNeuron));
            }
        }

        // Method to perform forward propagation for the layer
        function forward(inputs as Array<Lang.Float>) as Array<Lang.Float>
        {
            var outputs = [];
            for (var i = 0; i < mNeurons.size(); i++)
            {
                outputs.add(mNeurons[i].computeOutput(inputs));
            }

            return outputs;
        }
    }
}