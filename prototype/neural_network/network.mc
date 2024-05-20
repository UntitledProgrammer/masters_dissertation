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
    class PrioritisationNetwork
    {
        // Instance Attributes:
        hidden var mLayers as Array<Layer>;

        // Constructor:
        function initialize(layerSizes as Array<Lang.Integer>)
        {
            mLayers = [];
            for (i in [0:layerSizes.count()-2])
            {
                var layer = new Layer();
                layer.initialize(layerSizes[i+1], layerSizes[i]);
                mLayers.add(layer);
            }
        }

        // Method to perform forward propagation through the network
        function forward(inputs as Array<Lang.Float>) as Array<Lang.Float>
        {
            var outputs as Array<Lang.Float> = inputs;
            for (layer in mLayers)
            {
                outputs = layer.forward(outputs);
            }
            return outputs;
        }
    }
}