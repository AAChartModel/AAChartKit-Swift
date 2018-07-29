<!---->
<!--  AAOptionsConstructor.html-->
<!--  AAChartKit-Swift-->
<!---->
<!--  Created by An An  on 17/4/19.-->
<!--  Copyright © 2017年 An An . All rights reserved.-->
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 *  🌕 🌖 🌗 🌘  ❀❀❀   WARM TIPS!!!   ❀❀❀ 🌑 🌒 🌓 🌔
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

function configureAAOptions(sender, receivedWidth, receivedHeight) {

        //    alert(sender);//输出查看传输的是什么
        var aaChartModel = JSON.parse(sender);
        var o = document.getElementById('container'); //获得元素
        if (receivedWidth != 0) {
                o.style.width = receivedWidth; //设置宽度
        }
        o.style.height = receivedHeight; //设置高度
        if (aaChartModel.gradientColorEnable == true) { //开启图表渐变色功能
                var colors = aaChartModel.colorsTheme;
                aaChartModel.colorsTheme = Highcharts.map(colors,
                function(color) {
                        return {
                                linearGradient: {
                                        x1: 0,
                                        y1: 0,
                                        x2: 0,
                                        y2: 1
                                },
                                stops: [[0, color], [1, Highcharts.Color(color).setOpacity(0.45).get('rgba')]]
                        };
                });
        }

        var aaChart = {
                type: aaChartModel.chartType,//图表类型
                inverted: aaChartModel.inverted,//设置是否反转坐标轴，使X轴垂直，Y轴水平。 如果值为 true，则 x 轴默认是 倒置 的。 如果图表中出现条形图系列，则会自动反转
                backgroundColor: aaChartModel.backgroundColor,//图表背景色
                animation: true,
                pinchType: aaChartModel.zoomType,//设置手势缩放方向
                panning: true,//设置手势缩放后是否可平移
                polar: aaChartModel.polar,//是否辐射化图形
                marginLeft: aaChartModel.marginLeft,
                marginRight: aaChartModel.marginRight,
        };

        var aaTitle = {
                text: aaChartModel.title,//标题文本内容
                style: {
                        color: "#000000",//标题颜色
                        fontSize: "12px"//标题字体大小
                }
        };

        var aaSubtitle = {
                text: aaChartModel.subtitle,//副标题文本内容
                style: {
                        color: "#000000",//副标题颜色
                        fontSize: "9px"//副标题字体大小
                }
        };

        var aaTooltip = {
                enabled:aaChartModel.tooltipEnabled,
                valueSuffix: aaChartModel.tooltipValueSuffix,//浮动提示层数值的单位后缀
                shared: true,//多组数据浮动提示框是否共享
                crosshairs: aaChartModel.tooltipCrosshairs,//是否显示准星线
//                followTouchMove:false,//在触摸设备上，tooltip.followTouchMove选项为true（默认）时，平移需要两根手指。若要允许用一根手指平移，需要将followTouchMove设置为false。
        }

        var aaSeries = {
                stacking: aaChartModel.stacking,//图表堆叠类型
                animation: {
                        duration: aaChartModel.animationDuration,
                        easing: aaChartModel.animationType,
                }
        };
    
        var aaPlotOptions = {};
        aaPlotOptions.series = aaSeries;

        //数据点标记相关配置，只有线性图(折线图、曲线图、折线区域填充图、曲线区域填充图)才有数据点标记
        if (   aaChartModel.chartType === "area"
            || aaChartModel.chartType === "areaspline"
            || aaChartModel.chartType === "line"
            || aaChartModel.chartType === "spline") {

                var aaMarker = {};
                aaMarker.radius = aaChartModel.markerRadius; //曲线连接点半径，默认是4
                aaMarker.symbol = aaChartModel.symbol; //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
            
                //设置曲线连接点风格样式
                if (aaChartModel.symbolStyle === "innerBlank") {
                        aaMarker.fillColor = "#ffffff"; //点的填充色(用来设置折线连接点的填充色)
                        aaMarker.lineWidth = 2; //外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                        aaMarker.lineColor = ""; //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色。)
                } else if (aaChartModel.symbolStyle === "borderBlank") {
                        aaMarker.lineWidth = 2;
                        aaMarker.lineColor = aaChartModel.backgroundColor;
                }

                aaPlotOptions.series.marker = aaMarker;

        }

        aaPlotOptions = configureAAPlotOptions(aaPlotOptions, aaChartModel); //配置 aaPlotOptions
        var aaLegend = {
                enabled: aaChartModel.legendEnabled,
                layout: aaChartModel.legendLayout,
                align: aaChartModel.legendAlign,
                verticalAlign: aaChartModel.legendVerticalAlign,
                borderWidth: 0
        };

        var aaColorsTheme = aaChartModel.colorsTheme;

        var aaOptions = {};
        aaOptions.chart = aaChart;
        aaOptions.title = aaTitle;
        aaOptions.subtitle = aaSubtitle;
        aaOptions.tooltip = aaTooltip;
        aaOptions.legend = aaLegend;
        aaOptions.plotOptions = aaPlotOptions;
        aaOptions.colors = aaColorsTheme;
        aaOptions.series = aaChartModel.series;

        //x 轴和 Y 轴的相关配置,扇形图、金字塔图和漏斗图则不需要设置 X 轴和 Y 轴的相关内容
        if (   aaChartModel.chartType !== "pie"
            && aaChartModel.chartType !== "pyramid"
            && aaChartModel.chartType !== "funnel") {
                configureAxisContentAndStyle(aaOptions, aaChartModel);
//                alert("需要设置");
        }

        return aaOptions;
}

function configureAxisContentAndStyle(aaOptions, aaChartModel) {

        var aaXAxis = {
                label: {
                        enabled: aaChartModel.xAxisLabelsEnabled // X 轴是否显示文字
                },
                reversed: aaChartModel.xAxisReversed,
                //是否反转 X 轴
                gridLineWidth: aaChartModel.xAxisGridLineWidth,
                // X 轴网格线宽度
                categories: aaChartModel.categories,
                visible: aaChartModel.xAxisVisible
        };

        var aaYAxis = {
                label: {
                        enabled: aaChartModel.yAxisLabelsEnabled // Y 轴是否显示数字
                },
                reversed: aaChartModel.yAxisReversed,//是否反转 Y 轴
                gridLineWidth: aaChartModel.yAxisGridLineWidth,
                // Y 轴网格线宽度
                title: {
                        text: aaChartModel.yAxisTitle //Y 轴标题
                },
                lineWidth: aaChartModel.yAxisLineWidth,
                // Y 轴线宽度
                plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                }],
                visible: aaChartModel.yAxisVisible
        };

        aaOptions.xAxis = aaXAxis;
        aaOptions.yAxis = aaYAxis;
}

function configureAAPlotOptions(aaPlotOptions, aaChartModel) {

        if (aaChartModel.chartType === "column") {
                var aaColumn = {
                        borderWidth: 0,
                        borderRadius: aaChartModel.borderRadius,
                        dataLabels: {
                                enabled: aaChartModel.dataLabelEnabled,
                        }
                };
                if (aaChartModel.polar == true) {
                        aaColumn.pointPadding = 0;
                        aaColumn.groupPadding = 0.005;
                }
                aaPlotOptions.column = aaColumn;
        } else if (aaChartModel.chartType === "bar") {
                var aaBar = {
                        borderWidth: 0,
                        colorByPoint: false,
                        borderRadius: aaChartModel.borderRadius,
                        dataLabels: {
                                enabled: aaChartModel.dataLabelEnabled,
                        }
                };
                if (aaChartModel.polar == true) {
                        aaBar.pointPadding = 0;
                        aaBar.groupPadding = 0.005;
                }
                aaPlotOptions.bar = aaBar;
        } else if (aaChartModel.chartType === "area") {
                var aaArea = {
                        dataLabels: {
                                enabled: aaChartModel.dataLabelEnabled,
                        }
                };
                aaPlotOptions.area = aaArea;
        } else if (aaChartModel.chartType === "areaspline") {
                var aaAreaspline = {
                        dataLabels: {
                                enabled: aaChartModel.dataLabelEnabled,
                        }
                }
                aaPlotOptions.areaspline = aaAreaspline;
        } else if (aaChartModel.chartType === "line") {
                var aaLine = {
                        dataLabels: {
                                enabled: aaChartModel.dataLabelEnabled,
                        }
                };
                aaPlotOptions.line = aaLine;
        } else if (aaChartModel.chartType === "spline") {
                var aaSpline = {
                        dataLabels: {
                                enabled: aaChartModel.dataLabelEnabled,
                        }
                };
                aaPlotOptions.spline = aaSpline;
        } else if (aaChartModel.chartType === "pie") {
                var aaPie = {
                        //扇形图尺寸大小,大小设置得当的话,扇形图讲始终保持居中的位置,
                        //不偏不倚,将不会产生自动布局导致的大小变化
                        //                        size: 300,
                        allowPointSelect: true,
                        cursor: "pointer",
                        dataLabels: {
                                enabled: aaChartModel.dataLabelEnabled,
                                format: "{point.name}",
                        },
                        showInLegend: aaChartModel.legendEnabled,
                };
                aaPlotOptions.pie = aaPie;
        } else if (aaChartModel.chartType === "columnrange") {
                var aaColumnrange = {
                        dataLabels: {
                                enabled: aaChartModel.dataLabelEnabled,
                        }
                };
                aaPlotOptions.columnrange = aaColumnrange;
        };

        return aaPlotOptions;
}
