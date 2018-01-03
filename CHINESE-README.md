  ![AAInfographics-LOGO](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/AAInfographics-LOGO.png)
# AAInfographics

 
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) 
[![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE)
[![](https://img.shields.io/badge/language-Swift-green.svg)](https://github.com/AAChartModel/AAChartKit-Swift) 
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift)
[![](https://img.shields.io/badge/support-OC-orange.svg)](https://github.com/AAChartModel/AAChartKit)
[![](https://jaywcjlove.github.io/sb/lang/chinese.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md)
[![](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/AAChartModel/AAChartKit-Swift)

### 您所喜爱的`AAInfographics`开源图表库同时更有`Objective-C`版本可供使用,详情请点击以下链接
### 传送门
#### *https://github.com/AAChartModel/AAChartKit*
 

## 前言

 ***AAInfographics***,是 [AAChartKit](https://github.com/AAChartModel/AAChartKit) 的 `swift`语言版本,是在流行的开源前端图表库*Highcharts*的基础上,封装的面向对象的,一组简单易用,极其精美的图表绘制控件.

***
## 功能特性

1. 适配 `iOS 6`,  支持`ARC`,支持 `swift 3.0`及以上语言,配置简单.
2. 功能强大,支持`柱状图` 、`条形图` 、`折线图` 、`曲线图` 、`折线填充图` 、`曲线填充图`、`雷达图`、`极地图`、`扇形图`、`气泡图`、`散点图`、`金字塔图`、`漏斗图`、`区域范围图`、`柱形范围图`等多种图形
3. `动画`效果细腻精致,流畅优美.
4. 类 *Masonry* `链式编程语法`
5. `AAChartView +AAChartModel = Chart`,在 **AAInfographics** 封装库当中,遵循这样一个极简主义公式:`图表视图控件+图表模型=你想要的图表`.同另一个好用的图表库[AAChartKit](https://github.com/AAChartModel/AAChartKit)完全一致.
### *亲爱的,如果您使用时,觉得满意,请赏一颗星星✨,您的鼓励将是我继续努力的一大动力*.
***

## 使用方法

### 准备工作
* 将项目`demo`中的文件夹`AAInfographics`拖入到所需项目中.
 

### 正式开始
1. 在你的视图控制器文件中添加
```swift
import AAChartView.swift
```
2. 创建视图*AAChartView*
```swift
        CGFloat chartViewWidth  = self.view.frame.size.width;
        CGFloat chartViewHeight = self.view.frame.size.height;
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x:0,y:0,width:chartViewWidth,height:chartViewHeight)
        // 设置 aaChartView 的内容高度(content height)
        // aaChartView?.contentHeight = self.view.frame.size.height
        self.view.addSubview(aaChartView!)
 ```
3. 配置视图模型*AAChartModel*

* 链式编程的方式配置 *AAChartModel* 模型对象属性
```swift
    let chartModel = AAChartModel.init()
            .chartType(AAChartType.Column)//图表类型
            .title("城市天气变化")//图表主标题
            .subtitle("2020年09月18日")//图表副标题
            .inverted(false)//是否翻转图形
            .yAxisTitle("摄氏度")// Y 轴标题
            .legendEnabled(true)//是否启用图表的图例(图表底部的可点击的小圆点)
            .tooltipValueSuffix("摄氏度")//浮动提示框单位后缀
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                         "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])//主题颜色数组
            .series([
                [
                    "name": "东京",
                    "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                ], [
                    "name": "纽约",
                    "data": [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                ], [
                    "name": "柏林",
                    "data": [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                ], [
                    "name": "伦敦",
                    "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                ]])
```

4.  绘制图形(创建 AAChartView 实例对象后,首次绘制图形调用此方法)

```swift
    /*图表视图对象调用图表模型对象,绘制最终图形*/
    chartView?.aa_drawChartWithChartModel(chartModel)
```

5. 仅仅刷新图形的`series`数据内容(首次绘制图形完成之后,后续刷新图表数据均建议调用此方法)

```swift
    /*仅仅更新了图表的series数组数据,不改动图表的其他内容*/
    chartView?.aa_onlyRefreshTheChartDataWithChartModelSeries(chartModelSeriesArray)
```

6.  刷新图形整体内容

```swift
    /*更新 AAChartModel 整体内容(如修改了图表的类型,将 column chart 改为 area chart)之后,刷新图表*/
    chartView?.aa_refreshChartWholeContentWithChartModel(chartModel)
```


##  **AAChartModel**一些重要属性经过配置之后的图形示例如下

- ### line chart - 折线图

![line chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/LineChart.png)

- ### column chart - 柱形图

![IMG_1873.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1483.JPG)

- ### bar chart - 条形图

![bar chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/BarChart.png)

- ### special area chart one - 常规折线区域填充图

![IMG_1869.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1482.JPG)

- ### special area chart two - 带有负数的区域填充图

![IMG_1871.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/AreaChartOne.png))

- ### special area chart three - 堆积效果的区域填充图

![IMG_1863.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/AreaChartTwo.png)

- ### polar chart - 极地图

![polar chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/PolarChart.png)

- ### radar chart - 雷达图

![radar chart](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKitDemo/ChartsDemo/IMG_1877.JPG)

- ### pie chart - 扇形图

![pie chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/PieChart.png)

- ### bubble chart - 气泡图

![bubble chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/BubbleChart.png)

- ### scatter chart - 散点图

![scatter chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/ScatterChart.png)

- ### arearange chart - 区域范围图

![arearange chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/ArearangeChart.png)

- ### step area chart - 直方折线填充图

![step area chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/StepAreaChart.png)

- ### mixed chart - 混合图形

![mixed chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/MixedChart.png)


## 特别说明

### 特殊类型图表配置

**AAInfographics** 中扇形图、气泡图都归属为特殊类型,所以想要绘制扇形图、气泡图,图表模型 *AAChartModel* 的数据属性`series`设置稍有不同,示例如下

- 绘制扇形图,你需要这样配置模型对象 *AAChartModel*
```swift
            aaChartModel = AAChartModel.init()
                .chartType(AAChartType.Pie)
                .title("LANGUAGE MARKET SHARES JANUARY,2020 TO MAY")
                .subtitle("virtual data")
                .dataLabelEnabled(false)//是否直接显示扇形图数据
                .yAxisTitle("℃")
                .series(
                    [
                        [
                            "name": "Language market shares",
                            "innerSize":"50%",
                            "data": [
                                ["Java"  ,67],
                                ["Swift" ,44],
                                ["Python",83],
                                ["OC"    ,11],
                                ["Ruby"  ,42],
                                ["PHP"   ,31],
                                ["Go"    ,63],
                                ["C"     ,24],
                                ["C#"    ,888],
                                ["C++"   ,66],
                            ]
                        ],
                        ]
                    
```
- 绘制气泡图,你需要这样配置模型对象 *AAChartModel*

```swift  
          aaChartModel = AAChartModel.init()
                .chartType(AAChartType.Bubble)
                .title("AACHARTKIT BUBBLES")
                .subtitle("JUST FOR FUN")
                .yAxisTitle("℃")
                .series(
                    [
                        [
                            "data": [[97, 36, 79],
                                     [94, 74, 60],
                                     [68, 76, 58],
                                     [64, 87, 56],
                                     [68, 27, 73],
                                     [74, 99, 42],
                                     [7,  93, 87],
                                     [51, 69, 40],
                                     [38, 23, 33],
                                     [57, 86, 31]]
                        ],
                        [
                            "data": [[25, 10, 87],
                                     [2,  75, 59],
                                     [11, 54, 8 ],
                                     [86, 55, 93],
                                     [5,  3,  58],
                                     [90, 63, 44],
                                     [91, 33, 17],
                                     [97, 3,  56],
                                     [15, 67, 48],
                                     [54, 25, 81]]
                        ],
                        [
                            "data": [[47, 47, 21],
                                     [20, 12, 4 ],
                                     [6,  76, 91],
                                     [38, 30, 60],
                                     [57, 98, 64],
                                     [61, 17, 80],
                                     [83, 60, 13],
                                     [67, 78, 75],
                                     [64, 12, 10],
                                     [30, 77, 82]]
                        ]
                    ]
            )         
```

- 绘制柱形范围图,你需要这样配置模型对象 *AAChartModel*

```swift
            aaChartModel = AAChartModel.init()
                .chartType(AAChartType.Columnrange)
                .title("TEMPERATURE VARIATION BY MONTH")
                .subtitle("observed in Gotham city")
                .yAxisTitle("℃")
                .categories(["January", "February", "March", "April", "May", "June",
                             "July", "August", "September", "October", "November", "December"])
                .dataLabelEnabled(true)
                //.inverted(true)
                .series(
                    [
                        [
                            "name":"temperature",
                            "data":[
                                [-9.7,  9.4],
                                [-8.7,  6.5],
                                [-3.5,  9.4],
                                [-1.4, 19.9],
                                [0.0,  22.6],
                                [2.9,  29.5],
                                [9.2,  30.7],
                                [7.3,  26.5],
                                [4.4,  18.0],
                                [-3.1, 11.4],
                                [-5.2, 10.4],
                                [-13.5, 9.8]
                            ]]]
            )
```
***NOTE:*** 关于更多类型特殊图表的 `AAChartModel`实例对象属性配置,详情请见 ***AAInfographics*** 工程 `Demo` 中的`SpecialChartVC.swift`文件内容,查看文件内容详情请点击[这里](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/AAInfographicsDemo/Demo/SpecialChartVC.swift),您也可以选择下载 `Demo` 后,在  `Xcode` 中查看 ***AAInfographics*** 的`SpecialChartVC.swift`内容

### 当前已支持的图表类型有十种以上,说明如下

```swift
enum AAChartType:String{
    case Column      = "column"      //柱形图
    case Bar         = "bar"         //条形图
    case Area        = "area"        //折线区域填充图
    case AreaSpline  = "areaspline"  //曲线区域填充图
    case Line        = "line"        //折线图
    case Spline      = "spline"      //曲线图
    case Scatter     = "scatter"     //散点图
    case Pie         = "pie"         //扇形图
    case Bubble      = "bubble"      //气泡图
    case Pyramid     = "pyramid"     //金字塔图
    case Funnel      = "funnel"      //漏斗图
    case Columnrange = "columnrange" //柱形范围图
    case Arearange   = "arearange"   //区域范围图

}
```


### 当前已支持的图表渲染动画类型有三十种以上,说明如下

```swift
enum AAChartAnimationType:String {
    case EaseInQuad     = "easeInQuad"
    case EaseOutQuad    = "easeOutQuad"
    case EaseInOutQuad  = "easeInOutQuad"
    case EaseInCubic    = "easeInCubic"
    case EaseOutCubic   = "easeOutCubic"
    case EaseInOutCubic = "easeInOutCubic"
    case EaseInQuart    = "easeInQuart"
    case EaseOutQuart   = "easeOutQuart"
    case EaseInOutQuart = "easeInOutQuart"
    case EaseInQuint    = "easeInQuint"
    case EaseOutQuint   = "easeOutQuint"
    case EaseInOutQuint = "easeInOutQuint"
    case EaseInSine     = "easeInSine"
    case EaseOutSine    = "easeOutSine"
    case EaseInOutSine  = "easeInOutSine"
    case EaseInExpo     = "easeInExpo"
    case EaseOutExpo    = "easeOutExpo"
    case EaseInOutExpo  = "easeInOutExpo"
    case EaseInCirc     = "easeInCirc"
    case EaseOutCirc    = "easeOutCirc"
    case EaseInOutCirc  = "easeInOutCirc"
    case EaseOutBounce  = "easeOutBounce"
    case EaseInBack     = "easeInBack"
    case EaseOutBack    = "easeOutBack"
    case EaseInOutBack  = "easeInOutBack"
    case Elastic        = "elastic"
    case SwingFromTo    = "swingFromTo"
    case SwingFrom      = "swingFrom"
    case SwingTo        = "swingTo"
    case Bounce         = "bounce"
    case BouncePast     = "bouncePast"
    case EaseFromTo     = "easeFromTo"
    case EaseFrom       = "easeFrom"
    case EaseTo         = "easeTo"
}
```


## 关于`AAChartModel` 属性说明

* ### AAChartModel 主要属性说明

属性名称 | 属性类型 | 描述 | 取值范围 | 
------------ | ------------- | ------------- | ------------- |
title | String | 图表主标题 | 任意有效的字符串 | 
subtitle | String |图表副标题  | 任意有效的字符串 |
chartType | AAChartType |  图表类型,可以为`AAChartType`枚举字符串当中指定的任意有效类型.其中有支持`柱状图` 、`条形图` 、`折线图` 、`曲线图` 、`折线填充图` 、`曲线填充图`、`雷达图`、`扇形图`、`气泡图`、`散点图`、`金字塔图`、`漏斗图`、`区域范围图`、`柱形范围图`等多种图形  | AAChartType.Column,    AAChartType.Bar, AAChartType.Area, AAChartType.AreaSpline, AAChartType.Line,    AAChartType.Spline, AAChartType.Pie,    AAChartType.Bubble, AAChartType.Scatter, AAChartType.Pyramid, AAChartType.Funnel, AAChartType.Arearange, AAChartType.Columnrange|  AAChartType.Column |
stacking| AAChartStackingType | 是否将图表每个数据列的值叠加在一起。 默认的值为`AAChartStackingType.False`， 即禁用堆叠样式效果.另有常规堆叠样式和百分比堆叠样式可供选择 | AAChartStackingType.False, AAChartStackingType.Normal, AAChartStackingType.Percent | AAChartStackingType.False |
symbol | AAChartSymbolType | 预定义的图表曲线连接点的样式类型.其可供选择的值有`圆`、`正方形`、`钻石`、`常规三角形`和`倒三角形`,默认为混合样式 | AAChartSymbolType.Circle, AAChartSymbolType.Square, AAChartSymbolType.Diamond, AAChartSymbolType.Triangle, AAChartSymbolType.Triangle_down | 

* ### AAChartModel 所有属性列表说明
```swift
public var animationType:String?       //动画类型
public var title:String?               //标题内容
public var subtitle:String?            //副标题内容
public var chartType:String?           //图表类型
public var stacking:String?            //堆积样式
public var symbol:String?              //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
public var zoomType:String?            //缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
public var inverted:Bool?              //x 轴是否垂直
public var xAxisReversed:Bool?         //x 轴翻转
public var yAxisReversed:Bool?         //y 轴翻转
public var crosshairs:Bool?            //是否显示准星线(默认显示)
public var gradientColorEnable:Bool?   //是否要为渐变色
public var polar:Bool?                 //是否极化图形(变为雷达图)
public var dataLabelEnabled:Bool?      //是否显示数据
public var xAxisLabelsEnabled:Bool?    //x轴是否显示数据
public var categories:Array<Any>?      //x轴是否显示数据
public var xAxisGridLineWidth:Int?     //x轴网格线的宽度
public var yAxisLabelsEnabled:Bool?    //y轴是否显示数据
public var yAxisTitle:String?          //y轴标题
public var yAxisGridLineWidth:Int?     //y轴网格线的宽度
public var colorsTheme:Array<Any>?     //图表主题颜色数组
public var series:Array<Any>?          //图表的主题数据列数组
public var legendEnabled:Bool?         //是否显示图例
public var legendLayout:String?        //图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
public var legendAlign:String?         //设定图例在图表区中的水平对齐方式，合法值有 left，center 和 right。
public var legendVerticalAlign:String? //设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定
public var backgroundColor:String?     //图表背景色
public var options3dEnable:Bool?       //是否3D化图形(仅对条形图,柱状图有效)
public var options3dAlpha:Int?
public var  options3dBeta:Int?
public var options3dDepth:Int?         //3D图形深度
public var borderRadius:Int?           //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
public var markerRadius:Int?           //折线连接点的半径长度
```

## 附言

在 `AAInfographics` 封装库的初始设计中,为提升`.js`文件的加载速度,故将所依赖的`.js`文件放置在本地.然而由于本项目功能较多,故放置于本地的附加`JavaScript`文件库体积较大,整个`AAJSFiles`文件夹下所有的`.js`文件体积合计共有`5.3M左右`(当然在工程打包压缩之后实际大小远小于此),若对工程文件体积大小较为敏感的使用者,可使用以下建议的替代方案
1.  删除在本`AAInfographics`项目文件中,`AAJSFiles`文件夹下的`5`项`.js`文件.需要被删除的文件名称如下
* AAJQueryLibrary.js
* AAHighchartsLibrary.js
* AAHighchartsMore.js
* AAHighcharts-3d.js
* AAFunnel.js
2.  将`AAChartView.html`文件中的以下内容
``` html
<script src="AAJQueryLibrary.js">
</script>
<script src="AAHighchartsLibrary.js">
</script>
<script src="AAHighchartsMore.js">
</script>
<script src="AAHighcharts-3d.js">
</script>
<script src="AAFunnel.js">
</script>
```
替换为
``` html
<script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
```
即可.

此方案是将原本加载放置在本地的`.js`依赖文件改为了加载放置在网络上的`.js`文件,减小了本地文件大小,但有可能会有一定的网络延迟(`0.5s以内`),所以建议`AAInfographics`用户可根据自己的实际项目的开发需要,酌情选择最终是否使用本替代方案.

## 作者

![](https://avatars1.githubusercontent.com/u/16357599?s=40&v=4)An An
```java

                       _oo0oo_
                      o8888888o
                      88" . "88
                      (| -_- |)
                      0\  =  /0
                    ___/`---'\___
                  .' \\|     |// '.
                 / \\|||  :  |||// \
                / _||||| -:- |||||- \
               |   | \\\  -  /// |   |
               | \_|  ''\---/''  |_/ |
               \  .-\__  '-'  ___/-. /
             ___'. .'  /--.--\  `. .'___
          ."" '<  `.___\_<|>_/___.' >' "".
         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
         \  \ `_.   \_ __\ /__ _/   .-` /  /
     =====`-.____`.___ \_____/___.-`___.-'=====
                       `=---='
*******************************************************
     ¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥¥
         €€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€€
               $$$$$$$$$$$$$$$$$$$$$$$  
                   BUDDHA_BLESS_YOU       
                      AWAY_FROM
                         BUG

```

## 许可证

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png)

本项目 `AAInfographics`使用 MIT许可证,详情请点击[MIT LICENSE](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE)

## 联系方式

-------------------------------------------------------------------------------
* ❀❀❀   温馨提示   ❀❀❀
*
* 如果有任何使用上的问题,随时欢迎您在 GitHub 上向我提 issue.
* GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
-------------------------------------------------------------------------------
*  如果您想参与到此项目的开源活动中来,也同样随时欢迎您联系我
* GitHub        : https://github.com/AAChartModel
* StackOverflow : https://stackoverflow.com/users/7842508/codeforu
* JianShu       : http://www.jianshu.com/u/f1e6753d4254
* SegmentFault  : https://segmentfault.com/u/huanghunbieguan
-------------------------------------------------------------------------------

## 待办清单

> * - [x] 支持图形加载完成后用户添加代理事件
> * - [x] 支持图形动态刷新全局内容
> * - [x] 支持图形动态刷新纯数据`(series)`内容
> * - [ ] 支持图形实时刷新纯数据并动态滚动
> * - [x] 支持色彩图层渐变效果
> * - [x] 支持3D图形效果,仅对`柱状图`、`条形图`、`扇形图`、`散点图`、`气泡图`等部分图形有效
> * - [ ] 支持横屏(全屏)效果
> * - [ ] 支持自由设置图形渲染动画
> * - [ ] 支持已渲染图形生成图片文件
> * - [ ] 支持生成图片文件保存至系统相册
> * - [x] 支持用户自由配置`AAOptions`模型对象属性
> * - [x] 支持图形堆叠
> * - [x] 支持图形坐标轴反转
> * - [x] 支持渲染散点图
> * - [x] 支持渲染柱形范围图
> * - [x] 支持渲染面积范围图
> * - [ ] 支持渲染面积范围均线图
> * - [x] 支持渲染极地图
> * - [ ] 支持渲染折线直方图
> * - [ ] 支持渲染折线直方填充图
> * - [ ] 支持渲染矩形树状层级关系图
> * - [ ] 支持渲染活动刻度仪表图
> * - [ ] 支持为图形添加点击事件回调
