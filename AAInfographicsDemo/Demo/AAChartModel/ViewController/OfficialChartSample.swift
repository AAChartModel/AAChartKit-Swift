//
//  OfficialChartSample.swift
//  AAInfographics-ProDemo
//
//  Created by AnAn on 2024/12/6.
//

import SwiftUI
import AAInfographics

// 封装 AAChartView
@available(iOS 14.0, *)
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



@available(iOS 14.0, *)
@available(macCatalyst 14.0, *)
struct GridView: View {
      
   
    public var optionsItems = ChartSampleProvider.aaOptionsItems()
    
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
        GridItem(.flexible()),  // 列宽自动调整
        GridItem(.flexible()),
        GridItem(.flexible()),  // 列宽自动调整
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

//#Preview {
//    if #available(macCatalyst 14.0, *) {
//        GridView()
//    } else {
//        // Fallback on earlier versions
//    }
//}//
//  Ch
