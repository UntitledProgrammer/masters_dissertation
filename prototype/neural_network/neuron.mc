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
        /**
        *   The Neuron class represents a single neuron in a neural network.
        * 
        *   Each neuron computes an output based on its inputs and weights,
        *   applying an activation function to the weighted sum.
        */


        // Class Attributes:
        private const _MINIMUM_WEIGHT_VALUE as Lang.Float = 0.0;
        private const _MAXIMUM_WEIGHT_VALUE as Lang.Float = 1.0;


        // Instance Attributes:
        private var _mValue as Lang.Float = 0.0;
        private var _mWeights as Array<Lang.Float>;
        private var _mBias as Lang.Float = 0.0;


        // Constructor:
        public function initialize(pNumberOfInputs as Lang.Integer)
        {
            /**
            *   Constructor to initialize a neuron with a specified number of inputs.
            * 
            *   @param pNumberOfInputs the number of inputs to the neuron.
            */

            _mWeights = [];

            // Set a random value for each of the weights.
            for (var i = 0; i < pNumberOfInputs-1; i++)
            {
                var random = (Math.rand() & 100 + 0).toFloat() * 0.01;
                _mWeights.add(random);
            }

            // Set a random bias.
            var random = (Math.rand() & 100 + 0).toFloat() * 0.01;
            _mBias = random;
        }


        // Methods:
        public function computeOutput(pInputs as Array<Lang.Float>) as Lang.Float
        {
            /**
            *   Method to compute the output of the neuron.
            * 
            *   This method calculates the weighted sum of the inputs,
            *   adds the bias, applies an activation function, and stores
            *   the result as the neuron's output value.
            * 
            *   @param pInputs an array of float values representing the inputs to the neuron.
            *   @return the computed output value of the neuron.
            */

            var sum = 0.0;

            for (var i = 0; i < pInputs.size(); i++)
            {
                sum += pInputs[i] * _mWeights[i];
            }
            
            sum += _mBias; // Add the bias.
            _mValue = _activationFunction(sum); // Apply the activation function.

            return _mValue;
        }

        private function _activationFunction(pX as Lang.Float) as Lang.Float
        {
            /**
            *   Activation function for the neuron.
            * 
            *   This function applies a sigmoid activation function to the input value.
            * 
            *   @param x the input value to the activation function.
            *   @return the output value after applying the activation function.
            */

            //return 1.0 / (1.0 + Math.exp(-pX));
            return 1.0;
        }
    }
}