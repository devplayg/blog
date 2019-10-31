---
title: 'Highcharts tips'
type: posts
date: 2019-09-15T00:00:12+09:00
type: posts
categories: 
  - util
  - web
  - chart
  - api
tags:
  - highcharts
---


### xAxis.dateTimeLabelFormats

https://api.highcharts.com/highcharts/xAxis.dateTimeLabelFormats
    
    {
        millisecond: '%H:%M:%S.%L',
        second: '%H:%M:%S',
        minute: '%H:%M',
        hour: '%H:%M',
        day: '%e. %b',
        week: '%e. %b',
        month: '%b \'%y',
        year: '%Y'
    }
    
### Remove all series

    while(chart.series.length > 0) {
        chart.series[0].remove(true);
    }