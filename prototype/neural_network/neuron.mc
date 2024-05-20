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
    class Neuron
    {
        // Class Attributes:
        hidden const MINIMUM_WEIGHT_VALUE as Lang.Float = 0.0;
        hidden const MAXIMUM_WEIGHT_VALUE as Lang.Float = 1.0;

        // Instance Attributes:
        hidden var mValue as Lang.Float = 0.0;
        hidden var mWeights as Array<Lang.Float>;
        hidden var mBias as Lang.Float = 0.0;

        // Constructor:
        function initialize(pNumberOfInputs as Lang.Integer)
        {
            mWeights = [];

            // Set a random value for each of the weights.
            for (var i = 0; i < pNumberOfInputs-1; i++)
            {
                var random = (Math.rand() & 100 + 0).toFloat() * 0.01;
                mWeights.add(random);
            }

            // Set a random bias.
            var random = (Math.rand() & 100 + 0).toFloat() * 0.01;
            mBias = random;
        }

        // Method to compute the output of the neuron
        function computeOutput(pInputs as Array<Lang.Float>) as Lang.Float
        {
            var sum = 0.0;
            for (var i = 0; i < pInputs.size(); i++)
            {
                sum += pInputs[i] * mWeights[i];
            }
            sum += mBias; // Add the bias
            mValue = activationFunction(sum); // Apply activation function
            return mValue;
        }

        // Activation function (e.g., sigmoid)
        function activationFunction(x as Lang.Float) as Lang.Float
        {
            //return 1.0 / (1.0 + Math.exp(-x));
            return 1.0;
        }
    }
}