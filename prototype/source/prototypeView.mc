import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;

class Range
{
    // Instance Attributes:
    hidden var mMinimum as Lang.Number = 0;
    hidden var mMaximum as Lang.Number = 1;

    // Initialiser:
    function initialize(pMinimum as Lang.Number, pMaximum as Lang.Number)
    {
        if(pMinimum >= pMaximum) 
        {
            // If the minimum value is more than the maximum value, the minimum value should equate to the maximum value (Swap the minimum and maximum values).
            mMinimum = pMaximum;
            mMaximum = pMinimum;
            return;
        }

        mMinimum = pMinimum;
        mMaximum = pMaximum;
    }

    // Methods:
    function test(pValue as Lang.Number) as Lang.Boolean
    {
        if(pValue > mMaximum || pValue < mMinimum) { return false; }
        return true;
    }

    function set_minimum(pValue as Lang.Number)
    {
        if(pValue >= mMaximum) 
        { 
            mMaximum = pValue;
            return;
        }

        mMinimum = pValue;
    }

    function set_maximum(pValue as Lang.Number)
    {
        if(pValue <= mMinimum) 
        { 
            mMinimum = pValue;
            return;
        }

        mMaximum = pValue;
    }
}

class Metric 
{
    // Class Attributes:
    hidden const DEFAULT_EVALUATION as Lang.Number = 0;

    // Instance Attributes:
    hidden var mName as Lang.String = "";
    hidden var mRange as Range = new Range(0, 1);

    // Methods:
    function evaluate() as Lang.Boolean
    {
        return true;
    }

    // Methods:
    function get_name() as Lang.String { return mName; }
    function get_value() as Lang.Number { return DEFAULT_EVALUATION; }
}


class Cadence extends Metric
{
    // Initialiser:
    function initialize()
    {
        Metric.initialize();

        mName = "Cadence";
        mRange = new Range(180, 200);
    }

    // Methods:
    function get_value() as Lang.Number
    {
        var activityInfo = Activity.getActivityInfo();

        if (activityInfo != null && activityInfo.currentCadence != null) 
        {
            return activityInfo.currentCadence;
        }

        return 0;
    }

    function evaluate() as Lang.Boolean
    {
        return mRange.test(get_value());
    }
}

class Power extends Metric
{
    // Initialiser:
    function initialize()
    {
        mName = "Power";
        mRange = new Range(160, 188);
    }

    // Methods:
    function get_value() as Lang.Number
    {
        var activityInfo = Activity.getActivityInfo();

        if (activityInfo != null && activityInfo.currentPower != null) 
        {
            return activityInfo.currentPower;
        }

        return 0;
    }

    function evaluate() as Lang.Boolean
    {
        return mRange.test(get_value());
    }
}


class prototypeView extends WatchUi.WatchFace 
{

    // Instance Attributes:
    hidden var metricHeader;
    hidden var metricValue;
    hidden var metric as MetricFace = new MetricFace("Cadence");
    hidden var cadence as Cadence = new Cadence();
    hidden var metrics = [new Cadence(), new Power()];

    // Initialiser: 
    function initialize() 
    {
        WatchFace.initialize();

        var tree = new Tree();
        var treeNode = new TreeNode(Assessment.QUALITY);
    }

    // Methods:
    function getCurrentCadence() as Number
    {
        var activityInfo = Activity.getActivityInfo();

        if (activityInfo != null && activityInfo.currentCadence != null) 
        {
            return activityInfo.currentCadence;
        } 
        
        return 0;
    }

    function onLayout(dc as Dc) as Void 
    {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    function onShow() as Void 
    {
        // Initialise the metric header variable.
        metricHeader = new WatchUi.Text({
            :text=>"Hello World!",
            :color=>Graphics.COLOR_DK_GREEN,
            :font=>Graphics.FONT_LARGE,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER
        });
    }

    function onUpdate(dc as Dc) as Void 
    {
    
        // Update and clear the previous view frame.
        View.onUpdate(dc);

        // Reset Data Fields.
        metric.setValue(0);
        metric.setHeader("None");

        for( var i = 0; i < metrics.size(); i++ ) 
        {
            if(metrics[i].evaluate()) 
            { 
                metric.setValue(metrics[i].get_value());
                metric.setHeader(metrics[i].get_name());
            }
        }

        // Draw the current frame.
        metric.draw(dc);
    }
}
