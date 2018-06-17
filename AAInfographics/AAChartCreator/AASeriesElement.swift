//
//  AASeriesElement.swift
//  AAInfographicsDemo
//
//  Created by AnAn on 2018/4/10.
//  Copyright © 2018年 An An. All rights reserved.

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

class AASeriesElement: AASerializable {
    private var type:String?
    private var name:String?
    private var data:Array<Any>?
    private var color:Any?
    private var lineWidth:Float?//折线图、曲线图、直方折线图、折线填充图、曲线填充图、直方折线填充图的线条宽度
    private var borderWidth:Float?//柱形图、条形图、扇形图等图形的描边宽度
    private var borderColor:String?//柱形图、条形图、扇形图顿号等图形的描边颜色
    private var fillColor:Any?//折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色
    private var fillOpacity:Float?//折线填充图、曲线填充图、直方折线填充图等填充图类型的填充颜色透明度 Fill opacity for the area. Note that when you set an explicit fillColor, the fillOpacity is not applied. Instead, you should define the opacity in the fillColor with an rgba color definition. 默认是：0.75. https://api.hcharts.cn/highcharts#plotOptions.area.fillOpacity
    private var threshold:Float?//The threshold, also called zero level or base level. For line type series this is only used in conjunction with negativeColor. default：0.
    private var negativeColor:String?// The color for the parts of the graph or points that are below the threshold
    private var dashStyle:String?
    private var dataLabels:Dictionary<String,Any>?
    private var marker:Dictionary<String,Any>?
    private var step:Any?
    private var colorByPoint:Bool?
    private var allowPointSelect:Bool?
    private var zIndex:Int?
    private var innerSize:String?//内部圆环半径大小占比(内部圆环半径/扇形图半径)

    
    func type(_ prop:AAChartType) -> AASeriesElement {
        self.type = prop.rawValue
        return self
    }
    
    func name(_ prop:String) -> AASeriesElement {
        self.name = prop
        return self
    }
    
    func data(_ prop:Array<Any>) -> AASeriesElement {
        self.data = prop
        return self
    }
    
    func lineWidth(_ prop:Float) -> AASeriesElement {
        self.lineWidth = prop
        return self
    }
    
    func borderWidth(_ prop:Float) -> AASeriesElement {
        self.borderWidth = prop
        return self
    }
    
    func borderColor(_ prop:String) -> AASeriesElement {
        self.borderColor = prop
        return self
    }
    
    func fillColor(_ prop:Any) -> AASeriesElement {
        self.fillColor = prop
        return self
    }
    
    func color(_ prop:Any) -> AASeriesElement {
        self.color = prop
        return self
    }
    
    func fillOpacity(_ prop:Float) -> AASeriesElement {
        self.fillOpacity = prop
        return self
    }
    
    func threshold(_ prop:Float) -> AASeriesElement {
        self.threshold = prop
        return self
    }
    
    func negativeColor(_ prop:String) -> AASeriesElement {
        self.negativeColor = prop
        return self
    }
    
    func dashStyle(_ prop:AALineDashSyleType) -> AASeriesElement {
        self.dashStyle = prop.rawValue
        return self
    }
    
    func dataLabels(_ prop:Dictionary<String,Any>) -> AASeriesElement {
        self.dataLabels = prop
        return self
    }
    
    func marker(_ prop:Dictionary<String,Any>) -> AASeriesElement {
        self.marker = prop
        return self
    }
    
    func step(_ prop:Any) -> AASeriesElement {
        self.step = prop
        return self
    }
    
    func colorByPoint(_ prop:Bool) -> AASeriesElement {
        self.colorByPoint = prop
        return self
    }
    
    func allowPointSelect(_ prop:Bool) -> AASeriesElement {
        self.allowPointSelect = prop
        return self
    }
    
    func zIndex(_ prop:Int) -> AASeriesElement {
        self.zIndex = prop
        return self
    }
    
    func innerSize(_ prop:String) -> AASeriesElement {
        self.innerSize = prop
        return self
    }

}
