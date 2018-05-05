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
        var AAChartModel = JSON.parse(sender);
        var o = document.getElementById('container'); //获得元素
        if (receivedWidth != 0) {
                o.style.width = receivedWidth; //设置宽度
        }
        o.style.height = receivedHeight; //设置高度
    
        if (AAChartModel.gradientColorEnable == true) { //开启图表渐变色功能
            var colors = AAChartModel.colorsTheme;
            AAChartModel.colorsTheme = Highcharts.map(colors, function (color) {
                                                     return {
                                                     linearGradient:  { x1: 0, y1: 0, x2: 0, y2: 1},
                                                     stops: [
                                                             [0, color],
                                                             [1, Highcharts.Color(color).setOpacity(0.45).get('rgba')]
                                                             ]
                                                     };
                                                     });
        }
    
    
        var AAChart = {
                type: AAChartModel.chartType,//图表类型
                inverted: AAChartModel.inverted,//设置是否反转坐标轴，使X轴垂直，Y轴水平。 如果值为 true，则 x 轴默认是 倒置 的。 如果图表中出现条形图系列，则会自动反转
                backgroundColor: AAChartModel.backgroundColor,//图表背景色
                animation: true,
                pinchType: AAChartModel.zoomType,//设置手势缩放方向
                panning: true,//设置手势缩放后是否可平移
                polar: AAChartModel.polar,//是否辐射化图形
        };

        var AATitle = {
                text: AAChartModel.title,//标题文本内容
                style: {
                        color: "#000000",//标题颜色
                        fontSize: "12px"//标题字体大小
                }
        };

        var AASubtitle = {
                text: AAChartModel.subtitle,//副标题文本内容
                style: {
                        color: "#000000",//副标题颜色
                        fontSize: "9px"//副标题字体大小
                }
        };

        var AAXAxis = {
                label: {
                        enabled: AAChartModel.xAxisLabelsEnabled// X 轴是否显示文字
                },
                reversed: AAChartModel.xAxisReversed,//是否反转 X 轴
                gridLineWidth: AAChartModel.xAxisGridLineWidth,// X 轴网格线宽度
                categories: AAChartModel.categories,
                visible:AAChartModel.xAxisVisible
        };

        var AAYAxis = {
                label: {
                        enabled: AAChartModel.yAxisLabelsEnabled// Y 轴是否显示数字
                },
                reversed: AAChartModel.yAxisReversed,//是否反转 Y 轴
                gridLineWidth: AAChartModel.yAxisGridLineWidth,// Y 轴网格线宽度
                title: {
                        text: AAChartModel.yAxisTitle//Y 轴标题
                },
                lineWidth: 0,// Y 轴线宽度
                plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                }],
                visible:AAChartModel.yAxisVisible

        };

        var AATooltip = {
                enabled:AAChartModel.tooltipEnabled,
                valueSuffix: AAChartModel.tooltipValueSuffix,//浮动提示层数值的单位后缀
                shared: true,//多组数据浮动提示框是否共享
                crosshairs: AAChartModel.tooltipCrosshairs,//是否显示准星线
//                followTouchMove:false,//在触摸设备上，tooltip.followTouchMove选项为true（默认）时，平移需要两根手指。若要允许用一根手指平移，需要将followTouchMove设置为false。
        }

        var AASeries = {
                stacking: AAChartModel.stacking,//图表堆叠类型
                animation: {
                        duration: AAChartModel.animationDuration,
                        easing: AAChartModel.animationType,
                }
        };
    
        var AAPlotOptions = {};
        AAPlotOptions.series = AASeries;

        //数据点标记相关配置，只有线性图(折线图、曲线图、折线区域填充图、曲线区域填充图)才有数据点标记
        if (   AAChartModel.chartType === "area"
            || AAChartModel.chartType === "areaspline"
            || AAChartModel.chartType === "line"
            || AAChartModel.chartType === "spline") {

                var AAMarker = {};
                AAMarker.radius = AAChartModel.markerRadius; //曲线连接点半径，默认是4
                AAMarker.symbol = AAChartModel.symbol; //曲线点类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
            
                //设置曲线连接点风格样式
                if (AAChartModel.symbolStyle === "innerBlank") {
                        AAMarker.fillColor = "#ffffff"; //点的填充色(用来设置折线连接点的填充色)
                        AAMarker.lineWidth = 2; //外沿线的宽度(用来设置折线连接点的轮廓描边的宽度)
                        AAMarker.lineColor = ""; //外沿线的颜色(用来设置折线连接点的轮廓描边颜色，当值为空字符串时，默认取数据点或数据列的颜色。)
                } else if (AAChartModel.symbolStyle === "borderBlank") {
                        AAMarker.lineWidth = 2;
                        AAMarker.lineColor = AAChartModel.backgroundColor;
                }

            AAPlotOptions.series.marker = AAMarker;
            
        }

        AAPlotOptions = configureAAPlotOptions(AAPlotOptions, AAChartModel);//配置 AAPlotOptions

        var AALegend = {
                enabled: AAChartModel.legendEnabled,
                layout: AAChartModel.legendLayout,
                align: AAChartModel.legendAlign,
                verticalAlign: AAChartModel.legendVerticalAlign,
                borderWidth: 0
        };

        var AAColorsTheme = AAChartModel.colorsTheme;

        var AAOptions = {};
        AAOptions.chart = AAChart;
        AAOptions.title = AATitle;
        AAOptions.subtitle = AASubtitle;
        AAOptions.xAxis = AAXAxis;
        AAOptions.yAxis = AAYAxis;
        AAOptions.tooltip = AATooltip;
        AAOptions.legend = AALegend;
        AAOptions.plotOptions = AAPlotOptions;
        AAOptions.colors = AAColorsTheme;
        AAOptions.series = AAChartModel.series;

        //    alert(AAOptions.colorsTheme);//提示颜色字符串数组
        return AAOptions;

}

function configureAAPlotOptions(AAPlotOptions, AAChartModel) {
    
        if (AAChartModel.chartType === "column") {
                var AAColumn = {
                        borderWidth: 0,
                        borderRadius: AAChartModel.borderRadius,
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                };
            if (AAChartModel.polar == true) {
                AAColumn.pointPadding = 0;
                AAColumn.groupPadding = 0.005;
            }
                AAPlotOptions.column = AAColumn;
        } else if (AAChartModel.chartType === "bar") {
                var AABar = {
                        borderWidth: 0,
                        colorByPoint: false,
                        borderRadius: AAChartModel.borderRadius,
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                };
            if (AAChartModel.polar == true) {
                AABar.pointPadding = 0;
                AABar.groupPadding = 0.005;
            }
                AAPlotOptions.bar = AABar;
        } else if (AAChartModel.chartType === "area") {
                var AAArea = {
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.area = AAArea;
        } else if (AAChartModel.chartType === "areaspline") {
                var AAAreaspline = {
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                }
                AAPlotOptions.areaspline = AAAreaspline;
        } else if (AAChartModel.chartType === "line") {
                var AALine = {
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.line = AALine;
        } else if (AAChartModel.chartType === "spline") {
                var AASpline = {
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.spline = AASpline;
        } else if (AAChartModel.chartType === "pie") {
                var AAPie = {
                        //扇形图尺寸大小,大小设置得当的话,扇形图讲始终保持居中的位置,
                        //不偏不倚,将不会产生自动布局导致的大小变化
//                        size: 300,
                        allowPointSelect: true,
                        cursor: "pointer",
                        depth: AAChartModel.options3dDepth,
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                                format: "{point.name}",
                        },
                        showInLegend: AAChartModel.legendEnabled,
                };
                AAPlotOptions.pie = AAPie;
        } else if (AAChartModel.chartType === "columnrange") {
                var AAColumnrange = {
                         dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                         }
                };
                AAPlotOptions.columnrange = AAColumnrange;
        };

        return AAPlotOptions;
}
