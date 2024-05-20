
import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

module Jacobs
{
    class Layer
    {
        /**
        *   The Layer class represents a single layer in a neural network, containing multiple neurons.
        *   Each layer is responsible for initializing its neurons and handling forward propagation through the neurons.
        */

        // Instance Attributes:
        private var _mNeurons as Array<Neuron>;


        // Constructor:
        function initialize(pNumberOfNeurons as Lang.Integer, pNumberOfInputsPerNeuron as Lang.Integer)
        {
            /**
            *   Initializes a layer with a given number of neurons, each with a specified number of inputs.
            *   @param pNumberOfNeurons: the number of neurons in this layer.
            *   @param pNumberOfInputsPerNeuron: the number of inputs each neuron in this layer will have.
            */
            
            _mNeurons = [];

            for (var i = 0; i < pNumberOfNeurons-1; i++)
            {
                _mNeurons.add(new Neuron(pNumberOfInputsPerNeuron));
            }
        }


        // Methods:
        function forward(inputs as Array<Lang.Float>) as Array<Lang.Float>
        {
            /**
            *   Method for performing forward propagation of the layer.
            * 
            *   This method processes the input array through each neuron in the layer
            *   and returns an array of the resulting outputs.
            * 
            *   @param inputs an array of float values representing the inputs to the layer.
            *   @return an array of float values representing the outputs of the layer after forward propagation.
            */

            var outputs = [];

            for (var i = 0; i < _mNeurons.size(); i++)
            {
                // Calculate the output for each of the neurons.
                outputs.add(_mNeurons[i].computeOutput(inputs));
            }

            return outputs;
        }
    }
}