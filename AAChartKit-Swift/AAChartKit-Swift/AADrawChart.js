function drawChart(sender, receivedWidth, receivedHeight) {
        alert(receivedHeight);
        var chartModel = JSON.parse(sender);
        var o = document.getElementById('container'); //获得元素
        if (receivedWidth != 0) {
                o.style.width = receivedWidth; //设置宽度
        }
        o.style.height = receivedHeight; //设置高度
        var AAChart = {
                type: chartModel.chartType,
                inverted: chartModel.inverted,
                backgroundColor: chartModel.backgroundColor,
                animation: true,
                zoomType: chartModel.zoomType,
                panning: true,
                polar: chartModel.polar,
                options3d: {
                        enable: chartModel.options3dEnable,
                        alpha: -15
                }

        };

        var AATitle = {
                text: chartModel.title,
                style: {
                        color: "#000000",
                        fontSize: "12px"
                }
        };
        var AASubtitle = {
                text: chartModel.subtitle,
                style: {
                        color: "#000000",
                        fontSize: "9px"
                }
        };
        var AAXAxis = {
                label: {
                        enable: chartModel.xAxisLabelsEnabled
                },
                reversed: chartModel.xAxisGridLineWidth,
                gridLineWidth: chartModel.xAxisGridLineWidth,
                categories: chartModel.categories
        };
        var AAYAxis = {
                label: {
                        enable: chartModel.yAxisLabelsEnabled
                },
                reversed: chartModel.yAxisReversed,
                gridLineWidth: chartModel.yAxisGridLineWidth,
                title: {
                        text: chartModel.yAxisTitle
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
                enable: chartModel.legendEnabled,
                layout: chartModel.legendLayout,
                align: chartModel.legendAlign,
                verticalAlign: chartModel.legendVerticalAlign,
                borderWidth: 0
        };

        var chartModelStacking = chartModel.stacking;

        var AAPlotOptions = {};
        var series = {
                stacking: chartModelStacking,
                marker: {
                        radius: chartModel.markerRadius,
                        symbol: chartModel.symbol,
                }
        };
        AAPlotOptions.series = series;

        if (chartModel.chartType == "column") {
                var column = {
                        pointPadding: 0.2,
                        borderWidth: 0,
                        borderRadius: chartModel.borderRadius,
                        dataLabels: {
                                enabled: chartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.column = column;
        } else if (chartModel.chartType == "bar") {
                var bar = {
                        pointPadding: 0.2,
                        borderWidth: 0,
                        colorByPoint: false,
                        borderRadius: chartModel.borderRadius,
                        dataLabels: {
                                enabled: chartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.bar = bar

        } else if (chartModel.chartType == "area") {
                var area = {
                        dataLabels: {
                                enabled: chartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.area = area;
        } else if (chartModel.chartType == "areaspline") {
                var areaspline = {
                        dataLabels: {
                                enabled: chartModel.dataLabelEnabled,
                        }
                }
                AAPlotOptions.areaspline = areaspline;
        } else if (chartModel.chartType == "line") {
                var line = {
                        dataLabels: {
                                enabled: chartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.line = line;
        } else if (chartModel.chartType == "spline") {
                var spline = {
                        dataLabels: {
                                enabled: chartModel.dataLabelEnabled,
                        }
                };
                AAPlotOptions.spline = spline;
        } else if (chartModel.chartType == "pie") {
                var pie = {
                        allowPointSelect: true,
                        cursor: "pointer",
                        depth: chartModel.options3dDepth,
                        dataLabels: {
                                enabled: chartModel.dataLabelEnabled,
                                format: "<b>{point.name}</b>: {point.percentage:.1f} %",
                                style: {
                                        color: "black",
                                }
                        }
//                    < !--showInLegend: true,
//                        -->
                };
                AAPlotOptions.pie = pie;
        };

        var AASeries = chartModel.series;

        var AAOptions = {};
        AAOptions.chart = AAChart;
        AAOptions.title = AATitle;
        AAOptions.subtitle = AASubtitle;
        AAOptions.xAxis = AAXAxis;
        AAOptions.yAxis = AAYAxis;
        AAOptions.tooltip = AATooltip;
        AAOptions.legend = AALegend;
        AAOptions.plotOptions = AAPlotOptions;
        AAOptions.series = AASeries;

        $('#container').highcharts(AAOptions);

};
