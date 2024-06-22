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

module Jacobs
{
    class  PerformanceMetric
    {
        // Class Attributes:
        private const _DEFAULT_VALUE as Lang.Number = 0;
        private const _DEFAULT_NAME as Lang.String = "Default Name";

        // Methods:
        public function getName() as Lang.String { return _DEFAULT_NAME; }
        public function getValue() as Lang.Number { return _DEFAULT_VALUE; }

        public function getRange() as Lang.Number { return _DEFAULT_VALUE; }
        public function getUserPriority() as Lang.Number { return _DEFAULT_VALUE; }
        public function getFluctuation() as Lang.Number { return _DEFAULT_VALUE; }
        public function getRateOfChange() as Lang.Number { return _DEFAULT_VALUE; }
    }


    class BlackboxResult
    {
        public var priority as Lang.Number = 0;
        public var performance_metric as PerformanceMetric = new PerformanceMetric();

        public function initialize(priority as Lang.Number, metric as PerformanceMetric)
        {   
            self.priority = priority;
            self.performance_metric = metric;
        }
    }


    class Blackbox
    {
        // Instance Attributes:
        public var tolerance as Lang.Number = 0;
        private var _performanceMetrics as Array<PerformanceMetric> = [];


        // Constructor:
        public function initialize()
        {

        }


        // Methods:
        public function evaluate() as Array<BlackboxResult>
        {
            var results = new Array<BlackboxResult>[0];

            for(var i = 0; i < _performanceMetrics.size(); i++)
            {
                var result = (_performanceMetrics[i].getRange() + _performanceMetrics[i].getFluctuation() + _performanceMetrics[i].getRateOfChange() ) * _performanceMetrics[i].getUserPriority();
                
                if(results.size() <= 0 || results[0].priority - result <= tolerance)
                {
                    results.add(new BlackboxResult(result, _performanceMetrics[i]));
                }
            }

            return results;
        }
    }
}