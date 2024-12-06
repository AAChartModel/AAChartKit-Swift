//
//  OfficialChartSample.swift
//  AAInfographics-ProDemo
//
//  Created by AnAn on 2024/12/6.
//

import SwiftUI
import AAInfographics

// 封装 AAChartView
struct AAChartViewRepresentable: UIViewRepresentable {
    @Binding var chartOptions: AAOptions
    
    
    func makeUIView(context: Context) -> AAChartView {
        let chartView = AAChartView()
        chartView.isScrollEnabled = false
        return chartView
    }
    
    func updateUIView(_ uiView: AAChartView, context: Context) {
        uiView.aa_drawChartWithChartOptions(chartOptions)
    }
}



@available(macCatalyst 14.0, *)
struct GridView: View {
      
   
    let optionsItems = [
        
        AreaChartOptionsComposer.basicAreaChart(),//基础面积图
        AreaChartOptionsComposer.areaWithNegativeValuesChart(),//带有负值的面积图
        AreaChartOptionsComposer.stackedAreaChart(),//堆积面积图
        AreaChartOptionsComposer.percentStackedAreaChart(),//百分比堆积面积图
        AreaChartOptionsComposer.areaWithMissingPointsChart(),//带有缺失点的面积图
        AreaChartOptionsComposer.invertedAreaChart(),//翻转面积图
        AreaChartOptionsComposer.areasplineChart(),//曲线面积图
        AreaChartOptionsComposer.arearangeChart(),//区域范围图
        AreaChartOptionsComposer.arearangeAndLineChart(),//区域范围图和折线图混合图
        
        BarOrColumnChartOptionsComposer.basicBarChart(),//基础柱状图
        BarOrColumnChartOptionsComposer.stackingBarChart(),//堆积柱状图
        BarOrColumnChartOptionsComposer.populationPyramidChart(),//人口金字塔图
        BarOrColumnChartOptionsComposer.basicColumnChart(),//基础条形图
        BarOrColumnChartOptionsComposer.basicColumnChartWithNegativeValue(),//带有负值的条形图
        BarOrColumnChartOptionsComposer.basicColumnChartWithStackedDataLabels(),//带有数据标签的堆积条形图
        BarOrColumnChartOptionsComposer.basicColumnChartWithStackedDataLabels2(),//带有数据标签的堆积条形图2
        BarOrColumnChartOptionsComposer.percentStackedColumnChart(),//百分比堆积条形图
        BarOrColumnChartOptionsComposer.columnChartWithRotatedLabels(),//带有旋转标签的条形图
        BarOrColumnChartOptionsComposer.columnChartWithNestedColumn(),//嵌套条形图
        BarOrColumnChartOptionsComposer.columnRangeChart(),//条形范围图
//        
//        PieChartOptionsComposer.basicPieChart(),//基本饼状图
//        PieChartOptionsComposer.basicPieChartWithLegend(),//带有图例的基本饼状图
//        PieChartOptionsComposer.basicPieChartWithGradientColor(),//带有渐变色的基本饼状图
//        PieChartOptionsComposer.basicPieChartWithGradientColor2(),//带有渐变色的基本饼状图
//        PieChartOptionsComposer.basicPieChartWithMonochromeColor(),//带有单色的基本饼状图
//        PieChartOptionsComposer.customPieChartTitlePosition(),//自定义饼状图标题位置
        
        
        
        AARandomValueDataComposer.configureChartOptions(chartType: .column),          //Column series display one column per value along an X axis.
        AARandomValueDataComposer.configureChartOptions(chartType: .bar),             //A bar series is a special type of column series where the columns are horizontal.
        AARandomValueDataComposer.configureChartOptions(chartType: .area),            //The area series type.
        AARandomValueDataComposer.configureChartOptions(chartType: .areaspline),      //The area spline series is an area series where the graph between the points is smoothed into a spline.
        AARandomValueDataComposer.configureChartOptions(chartType: .line),            //A line series displays information as a series of data points connected by straight line segments.
        AARandomValueDataComposer.configureChartOptions(chartType: .spline),          //A spline series is a special type of line series, where the segments between the data points are smoothed.
        AARandomValueDataComposer.configureChartOptions(chartType: .scatter),         //A scatter plot uses cartesian coordinates to display values for two variables for a set of data.
        AARandomValueDataComposer.configureChartOptions(chartType: .pie),             //A pie chart is a circular graphic which is divided into slices to illustrate numerical proportion.
        AARandomValueDataComposer.configureChartOptions(chartType: .bubble),          //A bubble series is a three dimensional series type where each point renders an X, Y and Z value. Each points is drawn as a bubble where the position along the X and Y axes mark the X and Y values, and the size of the bubble relates to the Z value.
        AARandomValueDataComposer.configureChartOptions(chartType: .pyramid),         //A pyramid series is a special type of funnel, without neck and reversed by default.
        AARandomValueDataComposer.configureChartOptions(chartType: .funnel),          //Funnel charts are a type of chart often used to visualize stages in a sales project, where the top are the initial stages with the most clients. It requires that the modules/funnel.js file is loaded.
        AARandomValueDataComposer.configureChartOptions(chartType: .columnrange),     //The column range is a cartesian series type with higher and lower Y values along an X axis. To display horizontal bars, set chart.inverted to true.
        AARandomValueDataComposer.configureChartOptions(chartType: .arearange),       //The area range series is a carteseian series with higher and lower values for each point along an X axis, where the area between the values is shaded.
        AARandomValueDataComposer.configureChartOptions(chartType: .areasplinerange), //The area spline range is a cartesian series type with higher and lower Y values along an X axis. The area inside the range is colored, and the graph outlining the area is a smoothed spline.
        AARandomValueDataComposer.configureChartOptions(chartType: .boxplot),         //A box plot is a convenient way of depicting groups of data through their five-number summaries: the smallest observation (sample minimum), lower quartile (Q1), median (Q2), upper quartile (Q3), and largest observation (sample maximum).
        AARandomValueDataComposer.configureChartOptions(chartType: .waterfall),       //A waterfall chart displays sequentially introduced positive or negative values in cumulative columns.
        AARandomValueDataComposer.configureChartOptions(chartType: .polygon),         //A polygon series can be used to draw any freeform shape in the cartesian coordinate system. A fill is applied with the color option, and stroke is applied through lineWidth and lineColor options.
        AARandomValueDataComposer.configureChartOptions(chartType: .gauge),           //Gauges are circular plots displaying one or more values with a dial pointing to values along the perimeter.
        AARandomValueDataComposer.configureChartOptions(chartType: .errorbar),        //Error bars are a graphical representation of the variability of data and are used on graphs to indicate the error, or uncertainty in a reported measurement.
        
        
        
        
        
        
        
        
        
        
        
    ] as [AAOptions]
    
//    var optionsItemsWithoutAnimation: [AAOptions] {
//        var aaOptionsArr = [AAOptions]()
//        for aaOptions in optionsItems {
//            aaOptions.plotOptions?.series?.animation = false
//            aaOptionsArr.append(aaOptions)
//        }
//        return aaOptionsArr
//    }
    
    var items: [Int] {
           return Array(0...optionsItems.count-1)
       }


    // 定义网格的列
    let columns: [GridItem] = [
        GridItem(.flexible()),  // 列宽自动调整
        GridItem(.flexible()),
        GridItem(.flexible())   // 3 列
    ]

    var body: some View {
        ScrollView { // 添加滚动视图支持
            LazyVGrid(columns: columns, spacing: 16) { // 设置列和间距
                ForEach(items, id: \.self) { item in
//                 //添加一个充满的红色背景视图
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.gray)
//                        .frame(height: 100) // 设置高度
                    AAChartViewRepresentable(chartOptions: Binding.constant(optionsItemsWithoutAnimation(chartOptions: optionsItems[item])))
                        .frame(height: 600)
                    
                   
                }
            }
            .padding() // 添加内边距
        }
    }
    
    func optionsItemsWithoutAnimation(chartOptions: AAOptions) -> AAOptions {
//        chartOptions.chart?.animation = false
//        if chartOptions.chart != nil {
//            chartOptions.chart?.animation = false
//        } else {
//            chartOptions.chart = AAChart()
//            chartOptions.chart?.animation = false
//        }  //🤔这里禁用动画不行, 有点奇怪, 后续再看看吧
        
        let chartOptions = configurePlotOptionsSeriesAnimation(chartOptions)
        return chartOptions
    }
    
    private func configurePlotOptionsSeriesAnimation(_ aaOptions: AAOptions) -> AAOptions {
        if aaOptions.plotOptions == nil {
            aaOptions.plotOptions = AAPlotOptions().series(AASeries().point(AAPoint().events(AAPointEvents())))
        } else if aaOptions.plotOptions?.series == nil {
            aaOptions.plotOptions?.series = AASeries().point(AAPoint().events(AAPointEvents()))
        } 
        
        aaOptions.plotOptions?.series?.animation = false
        return aaOptions
    }
}

//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView()
//    }
//}



//#Preview {
//    SwiftUIChartView()
//}

//#Preview {
//    GridView()
//}


class AARandomValueDataComposer {
    public static func configureChartOptions(chartType: AAChartType) -> AAOptions {
       let aaChartModel = AAChartModel()
            .chartType(chartType)//图形类型
            .title(chartType.rawValue)//图形标题
            .animationType(.easeOutQuart)//图形渲染动画类型为"bounce"
            .dataLabelsEnabled(false)//是否显示数字
            .markerRadius(4)//折线连接点半径长度,为0时相当于没有折线连接点
            .markerSymbolStyle(.innerBlank)
            .legendEnabled(false)
            .tooltipEnabled(true)
            .series([
                AASeriesElement()
                    .color("#fe117c")
                    .data(configureSeriesDataArray())
                ,
            ])
        
        return aaChartModel.aa_toAAOptions()
    }
    
    private static func configureSeriesDataArray() -> [Any] {
        let randomNumArrA = NSMutableArray()
        var y1 = 0.0
        let Q = arc4random() % 38
        for  x in 0 ..< 100 {
            y1 = sin(Double(Q) * (Double(x) * Double.pi / 180)) + Double(x) * 2.0 * 0.01 - 1
            randomNumArrA.add(
                AADataElement()
                    .color(AAColor.red)
                    .y(Float(y1)))
        }
        return randomNumArrA as! [Any]
    }
}
