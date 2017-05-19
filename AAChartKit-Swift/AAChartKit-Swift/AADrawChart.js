function drawChart(sender,receivedWidth,receivedHeight){
    <!--                var chartModel = JSON.parse(sender)-->
    
    var chartModel = {
        title :'编程语言热度',
        subtitle : '虚拟数据',
        subtitleAlign : 'left',
        chartType :'column',
        stacking : 'percent',
        symbol :  'diamond',
        zoomType : 'x',
        pointHollow : true,
        inverted : false,
        backgroundColor : '#ffffff',
        options3dEnbale:true,
        xAxisReversed : false,
        yAxisReversed : false,
        crosshairs : true,
        gradientColorEnable : false,
        polar : false,
        dataLabelEnabled : true,
        xAxisLabelsEnabled : true,
        categories : ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        xAxisGridLineWidth : 1,
        yAxisLabelsEnabeld : true,
        yAxisTitle : '摄氏度',
        yAxisGridLineWidth : 1,
        colorsTheme : ["#b5282a","#e7a701","#50c18d","#fd4800","#f1c6c5"],
        legendEnabled : true,
    };
    
    
    
    alert(chartModel.chartType);
    var o=document.getElementById('container');//获得元素
    if(receivedWidth!=0){
        o.style.width=receivedWidth;//设置宽度
    }
    o.style.height=receivedHeight;//设置高度
    var chart = {
    type:chartModel.chartType,
    inverted:chartModel.inverted,
    backgroundColor:chartModel.backgroundColor,
    animation:true,
    zoomType:chartModel.zoomType,
    panning:true,
    polar:chartModel.polar,
    options3d:{
    enable:chartModel.options3dEnable,
    alpha:-15
    }
        
    };
    
    var title = {
    text: chartModel.title,
    style:{
    color:"#000000",
    fontSize:"12px"
    }
    };
    var subtitle = {
    text: chartModel.subtitle,
    style:{
    color:"#000000",
    fontSize:"9px"
    }
    };
    var xAxis = {
    label:{
    enable:chartModel.xAxisLabelsEnabled
    },
    reversed:chartModel.xAxisGridLineWidth,
    gridLineWidth:chartModel.xAxisGridLineWidth,
    categories:chartModel.categories
    };
    var yAxis = {
    label:{
    enable:chartModel.yAxisLabelsEnabled
    },
    reversed:chartModel.yAxisReversed,
    gridLineWidth:chartModel.yAxisGridLineWidth,
    title: {
    text: chartModel.yAxisTitle
    },
    lineWidth:0,
    plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
                }]
    };
    
    var tooltip = {
    valueSuffix: '\xB0C',
    shared:true,
    crosshairs:true,
    }
    
    var legend = {
    enable:chartModel.legendEnabled,
    layout: 'vertical',
    align: 'right',
    verticalAlign: 'middle',
    borderWidth: 0
    };
    
    var chartModelStacking = chartModel.stacking;
    
    var plotOptions = {};
    var series = {
    stacking:chartModelStacking,
    marker:{
    radius:chartModel.markerRadius,
    symbol:chartModel.symbol,
    }
    };
    plotOptions.series = series;
    
    
    if(chartModel.chartType =="column"){
        var column = {
        pointPadding:0.2,
        borderWidth:0,
        borderRadius:chartModel.borderRadius,
        dataLabels:{
        enabled:chartModel.dataLabelEnabled,
        }
        };
        plotOptions.column = column;
    }else if(chartModel.chartType=="bar"){
        var bar = {
        pointPadding:0.2,
        borderWidth:0,
        colorByPoint:false,
        borderRadius:chartModel.borderRadius,
        dataLabels:{
        enabled:chartModel.dataLabelEnabled,
        }
        };
        plotOptions.bar =bar
        
    }else if(chartModel.chartType =="area"){
        var area ={
        dataLabels:{
        enabled:chartModel.dataLabelEnabled,
        }
        };
        plotOptions.area = area;
    }else if(chartModel.chartType =="areaspline"){
        var areaspline ={
        dataLabels:{
        enabled:chartModel.dataLabelEnabled,
        }
        }
        plotOptions.areaspline = areaspline;
    }else if(chartModel.chartType =="line"){
        var line ={
        dataLabels:{
        enabled:chartModel.dataLabelEnabled,
        }
        };
        plotOptions.line = line;
    }else if(chartModel.chartType=="spline"){
        var spline ={
        dataLabels:{
        enabled:chartModel.dataLabelEnabled,
        }
        };
        plotOptions.spline =spline;
    }else if(chartModel.chartType=="pie"){
        var pie ={
        allowPointSelect:true,
        cursor:"pointer",
        depth:chartModel.options3dDepth,
        dataLabels:{
        enabled:chartModel.dataLabelEnabled,
        format:"<b>{point.name}</b>: {point.percentage:.1f} %",
        style:{
        color:"black",
        }
        }
            <!--                                          showInLegend:true,-->
        };
        plotOptions.pie = pie;
    };
    var series =  [
                   {
                   name: 'Tokyo',
                   data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2,
                          26.5, 23.3, 18.3, 13.9, 9.6]
                   },
                   {
                   name: 'New York',
                   data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8,
                          24.1, 20.1, 14.1, 8.6, 2.5]
                   },
                   {
                   name: 'London',
                   data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0,
                          16.6, 14.2, 10.3, 6.6, 4.8]
                   }
                   ];
    
    var json = {};
    json.chart = chart;
    json.title = title;
    json.subtitle = subtitle;
    json.xAxis = xAxis;
    json.yAxis = yAxis;
    json.tooltip = tooltip;
    json.legend = legend;
    json.plotOptions = plotOptions;
    json.series = series;
    
    $('#container').highcharts(json);
    
};
