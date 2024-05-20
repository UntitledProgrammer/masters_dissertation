import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;

class Assessment
{
    enum
    {
        FLUCTUATION = 0,
        QUALITY = 1,
        RATE_OF_CHANGE = 2,
        USER_PRIORITISATION = 3
    }
}

class Metrics
{
    // Instance Attributes:
    hidden var metrics = [0.0,0.0,0.0,0.0];

    // Initialiser:
    function initialize() { }

    // Methods:
    function get(metricType as Assessment)
    {
        return metrics[metricType];
    }

    function set(metricType as Assessment, value as Lang.Float)
    {
        metrics[metricType] = value;
    }
}

class TreeNode
{
    // Instance Attributes:
    hidden var mType = Assessment.QUALITY;
    hidden var mValue as Lang.Float = 0.0;

    // Initialiser:
    function initialize(pType)
    {
        mType = pType;
    }
}

class Tree
{
    // Instance Attributes:
    hidden var mNodes = new Array<TreeNode>[0];

    // Initialiser:
    function initialize() 
    {
        mNodes = [new TreeNode(Assessment.QUALITY), new TreeNode(Assessment.RATE_OF_CHANGE), new TreeNode(Assessment.USER_PRIORITISATION)];
    }

    // Methods:
    function evaluate(pMetrics as Metrics) as Lang.Boolean
    {
        var currentNodeIndex = 0;

        while (currentNodeIndex < mNodes.size())
        {
            var currentNode = mNodes[currentNodeIndex];

            if(currentNode == null) { return false;}

            if(pMetrics.get(currentNode.mType) <= currentNode.mValue) { return false; }

            currentNodeIndex = (currentNodeIndex * 2) + 1;
        }

        return true;
    }
}