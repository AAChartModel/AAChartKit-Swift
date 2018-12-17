 ![AAInfographics-LOGO](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/AAInfographics-LOGO.png)
# AAInfographics
 
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) </br>
[![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE)</br>
[![](https://img.shields.io/badge/language-Swift-green.svg)](https://github.com/AAChartModel/AAChartKit-Swift) </br>
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift#supported-animation-type-for-now)</br>
[![](https://img.shields.io/badge/support-OC-orange.svg)](https://github.com/AAChartModel/AAChartKit)</br>
[![](https://jaywcjlove.github.io/sb/lang/chinese.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md)</br>
[![](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/AAChartModel/AAChartKit-Swift)</br>
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/AAChartModel/AAChartKit-Swift.svg)](http://isitmaintained.com/project/AAChartModel/AAChartKit-Swift "Average time to resolve an issue")</br>
[![Percentage of issues still open](http://isitmaintained.com/badge/open/AAChartModel/AAChartKit-Swift.svg)](http://isitmaintained.com/project/AAChartModel/AAChartKit-Swift "Percentage of issues still open")

## [ **English Document 🇬🇧** ](https://github.com/AAChartModel-Swift/AAChartKit)  |  [ **简体中文文档 🇨🇳** ](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md)| [ **繁體中文文檔 🇭🇰** ](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/TRADITIONAL-CHINESE-README.md)

### There is the link of **Objective-C version** of  `AAChartKit` as follow
#### *https://github.com/AAChartModel/AAChartKit*
 
## Preface
 
 ***AAInfographics*** is the `Swift` language version of [AAChartKit](https://github.com/AAChartModel/AAChartKit)  which is object-oriented, a set of easy-to-use, extremely elegant graphics drawing controls,based on the popular open source front-end chart library *Highcharts*. It makes it very fast to add interactive charts to your mobile projects. It supports single touch-drag for data inspection, multi-touch for zooming, and advanced responsiveness for your apps .

***
## Features

1. Support `iOS 8`、`ARC` & `Swift`.
2. Powerful,support the  `column chart`、`bar chart`、`area chart`、`areaspline chart`、`line chart`、`spline chart`、`radar chart`、`polar chart`、`pie chart`、`bubble chart`、`pyramid chart`、`funnel chart`、`columnrange chart`and other graphics.
3. Interactive、animated, the `animation` effect is exquisite 、delicate、 smooth and beautiful.
4. Support `chain programming syntax` like *Masonry*.
5. `AAChartView + AAChartModel = Chart`  In the AAInfographics,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`. Like the powerful charts lib [AAChartKit](https://github.com/AAChartModel/AAChartKit).
***

## Appreciation

| Column Chart  | Column Range Chart  | Area Chart  |
| :----:  | :----: | :----: |
| ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/ColumnChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/BarChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/AreaChart.png) |

| Line Chart  | Step Area Chart  | Step Line Chart  |
| :----:  | :----: | :----: |
| ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/LineChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/StepAreaChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/StepLineChart.png) |

| Spline Chart | Areaspline Chart  | Stacked Polar Chart  |
| :----:  | :----: | :----: |
| ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/SplineChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/AreasplineChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/StackedPolarChart.png) |

| Bubble Chart  | Arearange Average Value Chart  | Column Mixed Line Chart  |
| :----:  | :----: | :----: |
| ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/BubbleChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/ArearangeAverageValueChart.png) | ![image1](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/ColumnMixedLineChart.png) |

## Installation

### CocoaPods

1. Add `pod 'AAInfographics'` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import  `AAInfographics`.

### Manually

1. Download whole project demo of `AAInfographicsDemo`
2. Drag the folder `AAInfographics` into your project.

## Usage

1. Creat the instance object of chart view:`AAChartView`
```swift
        CGFloat chartViewWidth  = self.view.frame.size.width
        CGFloat chartViewHeight = self.view.frame.size.height
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x:0,y:0,width:chartViewWidth,height:chartViewHeight)
        // set the content height of aachartView
        // aaChartView?.contentHeight = self.view.frame.size.height
        self.view.addSubview(aaChartView!)
  ```
2. Configure the properties of chart model:`AAChartModel`
c
``` swift
        aaChartModel = AAChartModel()
            .chartType(.column)//Can be any of the chart types listed under `AAChartType`.
            .animationType(.bounce)
            .title("TITLE")//The chart title
            .subtitle("subtitle")//The chart subtitle
            .dataLabelEnabled(false) //Enable or disable the data labels. Defaults to false
            .tooltipValueSuffix("USD")//the value suffix of the chart tooltip
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                         "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .series([
                AASeriesElement()
                    .name("Tokyo")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .toDic()!,
                AASeriesElement()
                    .name("New York")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    .toDic()!,
                AASeriesElement()
                    .name("Berlin")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                    .toDic()!,
                AASeriesElement()
                    .name("London")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                    .toDic()!,])
```
3.  Draw the chart(This method is called only for the first time after you create an AAChartView instance object)

```swift
        //The chart view object calls the instance object of AAChartModel and draws the final graphic
        aaChartView?.aa_drawChartWithChartModel(aaChartModel!)
```


🌹🌹🌹Congratulations! Everything was done!!! You will get what you want!!!

### Update chart content 
if you want to refresh chart content,you should do something as follow.According to your actual needs, select the function that fits you.


*  Only refresh the chart data(This method is recommended to be called for updating the series data dynamically)

```swift
        //Only refresh the chart series data
        aaChartView?.aa_onlyRefreshTheChartDataWithChartModelSeries(chartModelSeriesArray)
```

*  Refresh the chart, minus the chart data (this method is recommended for subsequent refreshes after the first drawing of graphics has completed. If you want to update the chart data only, you should use the function `aa_onlyRefreshTheChartDataWithChartModelSeries`)
```swift
        //Refresh the chart after the AAChartModel whole content is updated
        aaChartView?.aa_refreshChartWholeContentWithChartModel(aaChartModel!)
```

## Infographics sample

- ### line chart

![line chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/LineChart.png)

- ### column chart

![IMG_1873.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ColumnChart.png)

- ### bar chart

![bar chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/BarChart.png)

- ### special area chart one

![IMG_1869.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/IMG_1482.JPG)

- ### special area chart two

![IMG_1871.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/AreaChartOne.png)


- ### special area chart three

![IMG_1863.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/AreaChartTwo.png)

- ### polar chart

![polar chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/PolarChart.png)

- ### radar chart

![radar chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/RadarChart.png)

- ### pie chart

![pie chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/PieChart.png)

- ### bubble chart

![bubble chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/BubbleChart.png)

- ### scatter chart

![scatter chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ScatterChart.png)

- ### arearange chart

![arearange chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ArearangeChart.png)

- ### step area chart

![step area chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/StepAreaChart.png)

- ### mixed chart

![mixed chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/MixedChart.png)

## More graphics

>>> * Note: The following `DEMO picture` is a `GIF dynamic picture` which has a size of around *6M*. If you don't see any dynamic preview, then this is because the picture resources were not fully loaded. In such a case please be patient and wait for the contents to finish loading. Maybe you need to reload this page.

![AAChartKit-Live](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/AAChartKit-Live.gif)

## Special instructions

### Special charts in ***AAInfographics***
Pie chart and bubble chart are special in AAInfographics,if you want to draw these charts,you should do some different things for AAChartModel,for example

- To draw a pie chart,you should configure the properties of `AAChartModel` like this:
``` swift
            aaChartModel = AAChartModel()
                .chartType(.pie)
                .backgroundColor("#ffffff")
                .title("LANGUAGE MARKET SHARES JANUARY,2020 TO MAY")
                .subtitle("virtual data")
                .dataLabelEnabled(true)
                .yAxisTitle("℃")
                .series(
                    [
                        AASeriesElement()
                            .name("Language market shares")
                            .innerSize("20%")
                            .allowPointSelect(false)
                            .data([
                                ["Java"  ,67],
                                ["Swift",999],
                                ["Python",83],
                                ["OC"    ,11],
                                ["Go"    ,30],
                                ])
                            .toDic()!,
                        ]
            )
```
- To draw a bubble chart,you should configure the properties of `AAChartModel` like this:


``` swift
            aaChartModel = AAChartModel()
                .chartType(.bubble)
                .title("AACHARTKIT BUBBLES")
                .subtitle("JUST FOR FUN")
                .yAxisTitle("℃")
                .gradientColorEnable(true)
                .colorsTheme(["#0c9674","#7dffc0","#d11b5f","#facd32","#ffffa0","#EA007B"])
                .series(
                    [
                        AASeriesElement()
                            .name("BubbleOne")
                            .data([[97, 36, 79],
                                   [94, 74, 60],
                                   [68, 76, 58],
                                   [64, 87, 56],
                                   [68, 27, 73],
                                   [74, 99, 42],
                                   [7,  93, 99],
                                   [51, 69, 40],
                                   [38, 23, 33],
                                   [57, 86, 31],
                                   [33, 24, 22]
                                ])
                            .toDic()!,
                        AASeriesElement()
                            .name("BubbleTwo")
                            .data([[25, 60, 87],
                                   [2,  75, 59],
                                   [11, 54, 8 ],
                                   [86, 55, 93],
                                   [5,  33, 88],
                                   [90, 63, 44],
                                   [91, 43, 17],
                                   [97, 56, 56],
                                   [15, 67, 48],
                                   [54, 25, 81],
                                   [55, 66, 11]
                                ])
                            .toDic()!,
                        AASeriesElement()
                            .name("BubbleThree")
                            .data([[47, 47, 21],
                                   [20, 12, 66],
                                   [6,  76, 91],
                                   [38, 30, 60],
                                   [57, 98, 64],
                                   [61, 47, 80],
                                   [83, 60, 13],
                                   [67, 78, 75],
                                   [64, 12, 55],
                                   [30, 77, 82],
                                   [88, 66, 13]
                                ])
                            .toDic()!,
                        ]
            )
```

- To draw a columnrange chart,you should configure the properties of `AAChartModel` like this:

``` swift
             aaChartModel = AAChartModel()
                .chartType(.columnRange)
                .title("TEMPERATURE VARIATION BY MONTH")
                .subtitle("observed in Gotham city")
                .yAxisTitle("℃")
                .categories(["January", "February", "March", "April", "May", "June",
                             "July", "August", "September", "October", "November", "December"])
                .dataLabelEnabled(true)
                .inverted(true)
                .series(
                    [
                        AASeriesElement()
                            .name("temperature")
                            .data([
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
                                ])
                            .toDic()!,
                        ]
```

### Supported chart type for now

```swift
enum AAChartType: String {
    case column          = "column"          //column chart
    case bar             = "bar"             //bar chart 
    case area            = "area"            //area chart 
    case areaspline      = "areaspline"      //areaspline chart
    case line            = "line"            //line chart
    case spline          = "spline"          //spline chart
    case scatter         = "scatter"         //scatter chart 
    case pie             = "pie"             //pie chart
    case bubble          = "bubble"          //bubble chart  
    case pyramid         = "pyramid"         //pyramid chart
    case funnel          = "funnel"          //funnel chart
    case columnrange     = "columnrange"     //column range chart
    case arearange       = "arearange"       //area range chart
    case areasplinerange = "areasplinerange" //area spline range chart
    case boxplot         = "boxplot"         //boxplot chart
    case waterfall       = "waterfall"       //waterfall chart
    case polygon         = "polygon"         //polygon chart
}
```

### Supported zoom guesture types for now
```swift
enum AAChartZoomType: String {
    case none = "none"
    case x    = "x"
    case y    = "y"
    case xy   = "xy"
}
```

### Supported animation type for now

```swift

 public enum AAChartAnimationType: String {
    case easeInQuad     = "easeInQuad"
    case easeOutQuad    = "easeOutQuad"
    case easeInOutQuad  = "easeInOutQuad"
    case easeInCubic    = "easeInCubic"
    case easeOutCubic   = "easeOutCubic"
    case easeInOutCubic = "easeInOutCubic"
    case easeInQuart    = "easeInQuart"
    case easeOutQuart   = "easeOutQuart"
    case easeInOutQuart = "easeInOutQuart"
    case easeInQuint    = "easeInQuint"
    case easeOutQuint   = "easeOutQuint"
    case easeInOutQuint = "easeInOutQuint"
    case easeInSine     = "easeInSine"
    case easeOutSine    = "easeOutSine"
    case easeInOutSine  = "easeInOutSine"
    case easeInExpo     = "easeInExpo"
    case easeOutExpo    = "easeOutExpo"
    case easeInOutExpo  = "easeInOutExpo"
    case easeInCirc     = "easeInCirc"
    case easeOutCirc    = "easeOutCirc"
    case easeInOutCirc  = "easeInOutCirc"
    case easeOutBounce  = "easeOutBounce"
    case easeInBack     = "easeInBack"
    case easeOutBack    = "easeOutBack"
    case easeInOutBack  = "easeInOutBack"
    case elastic        = "elastic"
    case swingFromTo    = "swingFromTo"
    case swingFrom      = "swingFrom"
    case swingTo        = "swingTo"
    case bounce         = "bounce"
    case bouncePast     = "bouncePast"
    case easeFromTo     = "easeFromTo"
    case easeFrom       = "easeFrom"
    case easeTo         = "easeTo"
}
```

Here are the ten concrete animation types of **AAInfographics**

| Back      | Bounce    | Circ      | Cubic     | Elastic   |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![][1]    | ![][2]    | ![][3]    | ![][4]    | ![][5]    |


| Expo      | Quad      | Quart     | Quint     | Sine      |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![][6]    | ![][7]    | ![][8]    | ![][9]    | ![][10]   |


## About AAChartModel

* ### AAChartModel:chart basic properties instruction

Property name | Property type | Description | Value Range | 
------------ | ------------- | ------------- | ------------- |
title | String | The chart title | Any valid string | 
subtitle | String |The chart subtitle  | Any valid string |
chartType | AAChartType | The default series type for the chart. Can be any of the chart types listed under `AAChartType`.  | .column,  .bar,  .area,  .areaSpline,  .line,  .spline,  .pie,  .bubble,  .scatter,  .pyramid,  .funnel,  .areaRange,  .columnRange |  
stacking| AAChartStackingType | Whether to stack the values of each series on top of each other. Possible values are null to disable, "normal" to stack by value or "percent". When stacking is enabled, data must be sorted in ascending X order | .none,  .normal,  .percent | 
symbol | AAChartSymbolType | A predefined shape or symbol for the marker. When null, the symbol is pulled from options.symbols. Other possible values are "circle", "square", "diamond", "triangle" and "triangle-down" | .circle,  .square,  .diamond,  .triangle,  .triangleDown |


* ### AAChartModel:chart all properties list
```swift
private var animationType: String?       //The type of chart animation
private var title: String?               //The chart title
private var subtitle: String?            //The chart subtitle
private var chartType: String?           //The default series type for the chart. Can be any of the chart types listed under `AAChartType`. Defaults to line
private var stacking: String?            //Whether to stack the values of each series on top of each other. Possible values are null to disable, "normal" to stack by value or "percent". When stacking is enabled, data must be sorted in ascending X order
private var symbol: String?              //A predefined shape or symbol for the marker. When null, the symbol is pulled from options.symbols. Other possible values are "circle", "square", "diamond", "triangle" and "triangle-down"
private var zoomType: String?            //Decides in what dimensions the user can zoom by dragging the mouse. Can be one of x, y or xy
private var inverted: Bool?              //Whether to invert the axes so that the x axis is vertical and y axis is horizontal. When true, the x axis is reversed by default. If a bar series is present in the chart, it will be inverted automatically.Inverting the chart doesn't have an effect if there are no cartesian series in the chart, or if the chart is polar.Defaults to false
private var xAxisReversed: Bool?         //Whether to reverse the axis so that the highest number is closest to the origin. If the chart is inverted, the x axis is reversed by default. Defaults to false
private var yAxisReversed: Bool?         //Whether to reverse the axis so that the highest number is closest to the origin. If the chart is inverted, the x axis is reversed by default. Defaults to false
private var crosshairs: Bool?            //Enable or disable the crosshairs
private var gradientColorEnable: Bool?   //Enable or disable the gradient color
private var polar: Bool?                 //When true, cartesian charts like line, spline, area and column are transformed into the polar coordinate system. Requires `AAHighchartsMore.js`. Defaults to false
private var dataLabelEnabled: Bool?      //Enable or disable the data labels. Defaults to false
private var xAxisLabelsEnabled: Bool?    //Enable or disable the axis labels. Defaults to true
private var categories: Array<String>?      //Set new categories for the axis
private var xAxisGridLineWidth: Int?     //The width of the grid lines extending the ticks across the plot area.Defaults to 0
private var yAxisLabelsEnabled: Bool?    //Enable or disable the axis labels. Defaults to true
private var yAxisTitle: String?          //The actual text of the axis title
private var yAxisGridLineWidth: Int?     //The width of the grid lines extending the ticks across the plot area. Defaults to 1
private var colorsTheme: Array<Any>?     //An array containing the default colors for the chart's series. When all colors are used, new colors are pulled from the start again. Defaults to: ["#bb250c","#f67210","#fde680","#257679","#f1c6c5"]
private var series: Array<Any>?          //An array of all the chart's series
private var legendEnabled: Bool?         //Enable or disable the legend. Defaults to true
private var legendLayout: String?        //The layout of the legend items. Can be one of "horizontal" or "vertical". Defaults to horizontal
private var legendAlign: String?         //The horizontal alignment of the legend box within the chart area. Valid values are left, center and right.Defaults to center
private var legendVerticalAlign: String? //The vertical alignment of the legend box. Can be one of top, middle or bottom. Vertical position can be further determined by the y option.Defaults to bottom.
private var backgroundColor: String?     //The background color or gradient for the outer chart area. Defaults to #FFFFFF
private var borderRadius: Int?           //The corner radius of the outer chart border. Defaults to 0
private var markerRadius: Int?           //The radius of the point marker. Defaults to 4
private var titleColor: String?          //The chart title color
private var subTitleColor: String?       //The chart subtitle color
private var axisColor: String?           //The color of chart x axis and y axis
```

## Postscript

If you want to shrink the size of the `AAInfographics` lib ,you should do something like this:
1. Delete the `.js` file of `AAJSFiles` folder in `AAInfographics`,The names of multiple files that need to be deleted are as follows

* AAHighchartsLib.js
* AAHighchartsMore.js
* AAFunnel.js

2.Change the content of `AAChartView.html` file
``` html
<script src="AAHighchartsLib.js">
</script>
<script src="AAHighchartsMore.js">
</script>
<script src="AAFunnel.js">
</script>
```
to be

``` html
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
```

##  Created By

![](https://avatars1.githubusercontent.com/u/16357599?s=40&v=4)An An
``` java
 "CODE IS FAR AWAY FROM BUG WITH THE ANIMAL PROTECTING"
 
 *          ##2      ##2
 *       ┏-##1　  ┏-##1
 *    ┏_┛ ┻---━┛_┻━━┓
 *    ┃　　　        ┃　　　　 
 *    ┃　　 ━　      ┃　　　 
 *    ┃ @^　  @^    ┃　　 
 *    ┃　　　　　　  ┃
 *    ┃　　 ┻　　　 ┃
 *    ┃_　　　　　 _┃
 *     ┗━┓　　　┏━┛
 *    　　┃　　　┃神兽保佑
 *    　　┃　　　┃永无BUG！
 *    　　┃　　　┗━━━┓----|
 *    　　┃　　　　　　　  ┣┓}}}
 *    　　┃　　　　　　　  ┏┛
 *    　　┗┓&&&┓-┏&&&┓┏┛-|
 *    　　　┃┫┫　 ┃┫┫
 *    　　　┗┻┛　 ┗┻┛
 *
 *
 "CODE IS FAR AWAY FROM BUG WITH THE ANIMAL PROTECTING"
 ```

## Source Code⛓

Language Version | Project Name | Source Code Link |
------------ | ------------- | ------------- |
Swift | AAInfographics | https://github.com/AAChartModel/AAChartKit-Swift |
Objective C | AAChartKit | https://github.com/AAChartModel/AAChartKit |

## LICENSE

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png)

AAInfographics is available under the MIT license. See the [LICENSE](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE) file for more information.

## Contact

 -------------------------------------------------------------------------------
*  🌕 🌖 🌗 🌘    WARM TIPS!!!    🌑 🌒 🌓 🌔
*
* Please contact me on GitHub,if there are any problems encountered in use.
* GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
-------------------------------------------------------------------------------
* And if you want to contribute for this project, please contact me as well
* GitHub        : https://github.com/AAChartModel
* StackOverflow : https://stackoverflow.com/users/7842508/codeforu
* JianShu       : http://www.jianshu.com/u/f1e6753d4254
* SegmentFault  : https://segmentfault.com/u/huanghunbieguan
-------------------------------------------------------------------------------

## Todo list

- [x] Support for the user to add delegate events after the graphics content loading was completed
- [x] Support graphics to refresh global content dynamically
- [x] Support graphics to refresh pure data (`series`) content dynamically
- [x] Support color layer gradient effects
- [x] Support 3D graphics effects, valid only for partial graphics such as `column chart`、`bar chart`、`pie charts`、`scatterplot chart`、`bubble chart`, etc
- [x] Support horizontal screen (full screen) effect
- [x] Support setting graphics rendering animation freely
- [x] Support for users to configure `AAOptions` model object properties freely
- [x] Support stacking the graphics 
- [x] Support reversing the graphics axis 
- [x] Support rendering the scatter chart
- [x] Support rendering the column range map
- [x] Support rendering the area range graph
- [x] Support rendering the polar chart
- [x] Support rendering the step line chart
- [x] Support rendering the step area chart
- [ ] Support rendering the rectangular tree hierarchy diagrams
- [ ] Support rendering the circular progress bar chart 
- [ ] Support adding clicked event callbacks for graphics
- [ ] Support graphics to refresh pure data in real time and scroll dynamically
- [ ] Support rendered graphics to generate image files
- [ ] Support generating image files saved to the system album


[1]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/1.gif
[2]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/2.gif
[3]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/3.gif
[4]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/4.gif
[5]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/5.gif
[6]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/6.gif
[7]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/7.gif
[8]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/8.gif
[9]:  https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/9.gif
[10]: https://raw.githubusercontent.com/adad184/MMTweenAnimation/master/Images/10.gif
