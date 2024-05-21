import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

module Jacobs
{
    class PrioritisationNetwork
    {
        /**
        *   The PrioritisationNetwork class represents a specialised neural network composed of multiple layers.
        * 
        *   This class is responsible for initializing the network structure and performing forward propagation
        *   through the entire network.
        */


        // Instance Attributes:
        private var _mLayers as Array<Layer>;


        // Constructor:
        function initialize(pLayerSizes as Array<Lang.Integer>)
        {
            /**
            *   Constructor to initialize the network with a given layer structure.
            * 
            *   @param layerSizes: an array of integers where each element represents the number of neurons in that layer.
            */

            _mLayers = [];

            for (var i = 0; i < pLayerSizes.size(); i++)
            {
                _mLayers.add(new Layer(pLayerSizes[i+1], pLayerSizes[i]));
            }
        }


        // Methods:
        function forward(pInputs as Array<Lang.Float>) as Array<Lang.Float>
        {
            /**
            *   Performs a forward propagation of each layer in the network, returning a final output layer.
            * 
            *   @param inputs an array of float values representing the inputs to the network.
            *   @return an array of float values representing the outputs of the network after forward propagation.
            */

            var outputs = pInputs;

            // Calculate the output for each layer of the network.
            for (var i = 0; i < _mLayers.size(); i++) { outputs = _mLayers[i].forward(outputs); }

            return outputs;
        }
    }
}