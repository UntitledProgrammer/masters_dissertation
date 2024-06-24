import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;
import Jacobs;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;

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

class PerformanceMetric extends Prioritisable
{
    // Instance Attributes:
    public var value as Number = 0;
    public var name as String = "DEFAULT_NAME";

    // Constructor:
    public function initialize(name as String, value as Number)
    {
        self.value = value;
        self.name = name;
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
    private var layoutOrchestrator as LayoutOrchestrator = new LayoutOrchestrator();

    // Initialiser: 
    function initialize() 
    {
        WatchFace.initialize();

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

        var array = new Array<Message>[0];
        array.add(new Message("hello worlds", 152, 0));
        //array.add(new Message("goodbye world", 180, 0));
        // array.add(new Message("third display", 200, 0));

        layoutOrchestrator.draw(array, dc);
    }
}
