function drawChart(sender, receivedWidth, receivedHeight) {
        var AAChartModel = JSON.parse(sender);
        var o = document.getElementById('container'); //获得元素
        o.style.width = receivedWidth; //设置宽度
        o.style.height = receivedHeight; //设置高度
        var AAChart = {
                type: AAChartModel.chartType,
                inverted: AAChartModel.inverted,
                backgroundColor: AAChartModel.backgroundColor,
                animation: true,
                zoomType: AAChartModel.zoomType,
                panning: true,
                polar: AAChartModel.polar,
                options3d: {
                        enable: AAChartModel.options3dEnable,
                        alpha: -15
                }

        };

        var AATitle = {
                text: AAChartModel.title,
                style: {
                        color: "#000000",
                        fontSize: "12px"
                }
        };
        var AASubtitle = {
                text: AAChartModel.subtitle,
                style: {
                        color: "#000000",
                        fontSize: "9px"
                }
        };
        var AAXAxis = {
                label: {
                        enable: AAChartModel.xAxisLabelsEnabled
                },
                reversed: AAChartModel.xAxisGridLineWidth,
                gridLineWidth: AAChartModel.xAxisGridLineWidth,
                categories: AAChartModel.categories
        };
        var AAYAxis = {
                label: {
                        enable: AAChartModel.yAxisLabelsEnabled
                },
                reversed: AAChartModel.yAxisReversed,
                gridLineWidth: AAChartModel.yAxisGridLineWidth,
                title: {
                        text: AAChartModel.yAxisTitle
                },
                lineWidth: 0,
                plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                }]
        };

        var AATooltip = {
                valueSuffix: '\xB0C',
                shared: true,
                crosshairs: true,
        }

        var AALegend = {
                enable: AAChartModel.legendEnabled,
                layout: AAChartModel.legendLayout,
                align: AAChartModel.legendAlign,
                verticalAlign: AAChartModel.legendVerticalAlign,
                borderWidth: 0
        };

        var AAChartModelStacking = AAChartModel.stacking;

        var AAPlotOptions = {};
        var series = {
                stacking: AAChartModelStacking,
                marker: {
                        radius: AAChartModel.markerRadius,
                        symbol: AAChartModel.symbol,
                }
        };
        AAPlotOptions.series = series;

        if (AAChartModel.chartType == "column") {
                var AAColumn = {
                        pointPadding: 0.2,
                        borderWidth: 0,
                        borderRadius: AAChartModel.borderRadius,
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.column = AAColumn;
        } else if (AAChartModel.chartType == "bar") {
                var AABar = {
                        pointPadding: 0.2,
                        borderWidth: 0,
                        colorByPoint: false,
                        borderRadius: AAChartModel.borderRadius,
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.bar = AABar;

        } else if (AAChartModel.chartType == "area") {
                var AAArea = {
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.area = AAArea;
        } else if (AAChartModel.chartType == "areaspline") {
                var AAAreaspline = {
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                }
                AAPlotOptions.areaspline = AAAreaspline;
        } else if (AAChartModel.chartType == "line") {
                var AALine = {
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.line = AALine;
        } else if (AAChartModel.chartType == "spline") {
                var AASpline = {
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.spline = AASpline;
        } else if (AAChartModel.chartType == "pie") {
                var AAPie = {
                        allowPointSelect: true,
                        cursor: "pointer",
                        depth: AAChartModel.options3dDepth,
                        dataLabels: {
                                enabled: AAChartModel.dataLabelEnabled,
                                format: "<b>{point.name}</b>: {point.percentage:.1f} %",
                                style: {
                                        color: "black",
                                }
                        }
//                    < !--showInLegend: true,
//                        -->
                };
                AAPlotOptions.pie = AAPie;
        };
        var AAColorsTheme = AAChartModel.colorsTheme;
        var AASeries = AAChartModel.series;

        var AAOptions = {};
        AAOptions.chart = AAChart;
        AAOptions.title = AATitle;
        AAOptions.subtitle = AASubtitle;
        AAOptions.xAxis = AAXAxis;
        AAOptions.yAxis = AAYAxis;
        AAOptions.tooltip = AATooltip;
        AAOptions.legend = AALegend;
        AAOptions.plotOptions = AAPlotOptions;
        AAOptions.colorsTheme = AAColorsTheme;
        AAOptions.series = AASeries;

        $('#container').highcharts(AAOptions);

};
