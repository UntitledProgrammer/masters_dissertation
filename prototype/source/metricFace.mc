import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Activity;

using Toybox.Application as App;
using Toybox.Activity as Activity;
using Toybox.System as Sys;

class MetricFace extends WatchUi.Drawable 
{
    // Class Attributes:
    hidden const HEADER_OFFSET_Y as Lang.Number = 20;
    hidden const VALUE_OFFSET_Y as Lang.Number = 54;

    // Instance Attributes:
    hidden var m_value as Lang.Float = 0.0f;
    hidden var m_header_label;
    hidden var m_value_label;

    // Initialiser:
    function initialize(p_name as Lang.String)
    {
        m_header_label = new WatchUi.Text({
            :text=> p_name,
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_LARGE,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>(WatchUi.LAYOUT_VALIGN_CENTER) + HEADER_OFFSET_Y
        });

        m_value_label = new WatchUi.Text({
            :text=> "0",
            :color=>Graphics.COLOR_BLACK,
            :font=>Graphics.FONT_NUMBER_THAI_HOT,
            :locX =>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER + VALUE_OFFSET_Y
        });
    }

    // Methods:
    function setValue(p_value as Lang.Number) as Void
    {
        m_value_label.setText(p_value.format("%o"));
    }

    function setHeader(p_name as Lang.String) as Void
    {
        m_header_label.setText(p_name);
    }

    function onUpdate(dc) as Void
    {

    }
    

    function draw(p_dc) as Void
    {
        m_header_label.draw(p_dc);
        m_value_label.draw(p_dc);
    }
}