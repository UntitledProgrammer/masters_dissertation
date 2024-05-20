import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;


class prototypeView extends WatchUi.WatchFace 
{

    // Instance Attributes:
    hidden var metricHeader;
    hidden var metricValue;
    hidden var metric as MetricFace = new MetricFace("Cadence");

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

        metric.setValue(getCurrentCadence());

        // Draw the current frame.
        metric.draw(dc);
    }
}
