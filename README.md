 
# AAInfographics
 
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) 
[![](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/LICENSE) 
[![](https://img.shields.io/badge/language-Swift-green.svg)](https://github.com/AAChartModel/AAChartKit-Swift) 
[![](https://img.shields.io/badge/Support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift) 
[![](https://img.shields.io/badge/support-OC-orange.svg)](https://github.com/AAChartModel/AAChartKit) 
### 中文使用说明书地址
#### *https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md*
 
***
## Features:
1. Support `iOS 8`、`ARC` & `Swift`.
2. Powerful,support the  `column chart` `bar chart` `line chart` `spline chart` `pie chart` `polar chart` `radar chart` and other graphics.
3. Interactive、animated,the `animation` is exquisite and deligate.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAInfographics,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`.  
***


## Usage:

### The need of preparation
1. Drag the folder `AAInfographicsFiles` into your project.
  

### The offical start of the work 
1.Add the following content into `your view controller` file.
```swift
import AAChartView.swift
```
2.Creat the object of chart view:`AAChartView`
```swift
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
        aaChartView?.contentHeight = self.view.frame.size.height
        self.view.addSubview(aaChartView!)
  ```
3.Configure the properties of chart model:`AAChartModel`

``` swift
        chartModel = AAChartModel.init()
            .chartTypeSet(AAChartType(rawValue: self.chartType!)!)
            .animationTypeSet(AAChartAnimationType.Swing)
            .titleSet("donghua")
            .subtitleSet("subtitle")
            .pointHollowSet(true)
            .dataLabelEnabledSet(false)
            .markerRadiusSet(15)
            .seriesSet([
                [
                    "name": "Tokyo",
                    "data": [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                ], [
                    "name": "New York",
                    "data": [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                ], [
                    "name": "Berlin",
                    "data": [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                ], [
                    "name": "London",
                    "data": [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                ]]);
```
4.  Draw the chart

```objective-c
        [chartView aa_drawChartWithChartModel:chartModel];
```
5.  Refresh the chart

```objective-c
        [chartView aa_refreshChartWithChartModel:chartModel];
```

6. Special instructions

Pie chart and bubble chart are special in AAInfographics,if you want to draw these charts,you should do some different things for AAChartModel,for example

- To draw a pie chart,you should configure the properties of `AAChartModel` like this:
``` swift
    var chartModel = AAChartModel.init();
        chartModel.chartType = AAChartTypeColumnrange;
        chartModel.title = "编程语言热度";
        chartModel.subtitle = "虚拟数据";
        chartModel.yAxisTitle = "摄氏度";
        chartModel.dataLabelEnabled = true;//show the data label or not
        chartModel.series =
            [
                [
                    type: "pie",
                    name: "浏览器访问量占比",
                    data: [
                    ["Firefox",   45.0],
                    ["IE",       26.8],
                    [
                    name: "Chrome",
                    y: 12.8,
                    sliced: true,
                    selected: true
                    ],
                    ["Safari",    8.5],
                    ["Opera",     6.2],
                    ["其他",   0.7]
                    ]
                ]
        ]
        
        ;

```
- To draw a bubble chart,you should configure the properties of `AAChartModel` like this:


``` swift
    var chartModel = AAChartModel.init();
        chartModel.chartType = "column";
        chartModel.title = "编程语言热度";
        chartModel.subtitle = "虚拟数据";
        chartModel.yAxisTitle = "摄氏度";
        chartModel.series = [
            [
                "name":"数据列 ONE",
                "data": [
                    [9,  81, 63],
                    [98, 5,  89],
                    [51, 50, 73],
                    [41, 22, 14],
                    [58, 24, 20],
                    [78, 37, 34],
                    [55, 56, 53],
                    [18, 45, 70],
                    [42, 44, 28],
                    [3,  52, 59],
                    [31, 18, 97],
                    [79, 91, 63],
                    [93, 23, 23],
                    [44, 83, 22]
                ]],
            
            [
                "name":"数据列 TWO",
                "data": [
                    [42, 38, 20],
                    [6,  18, 1 ],
                    [1,  93, 55],
                    [57, 2,  90],
                    [80, 76, 22],
                    [11, 74, 96],
                    [88, 56, 10],
                    [30, 47, 49],
                    [57, 62, 98],
                    [4,  16, 16],
                    [46, 10, 11],
                    [22, 87, 89],
                    [57, 91, 82],
                    [45, 15, 98]
                ]],
            
            [
                "name":"数据列 THREE",
                "data": [
                    [47, 47, 21],
                    [20, 12, 4 ],
                    [6,  76, 91],
                    [38, 30, 60],
                    [57, 98, 64],
                    [61, 17, 80],
                    [83, 60, 13],
                    [67, 78, 75],
                    [64, 12, 10],
                    [30, 77, 82],
                    [90, 63, 44],
                    [91, 33, 17],
                    [15, 67, 48],
                    [54, 25, 81]]
            ]
        ];
```

- To draw a columnrange chart,you should configure the properties of `AAChartModel` like this:

``` swift
    var chartModel = AAChartModel.init();
        chartModel.chartType = AAChartTypeColumnrange;
        chartModel.title = "编程语言热度";
        chartModel.subtitle = "虚拟数据";
        chartModel.yAxisTitle = "摄氏度";
        chartModel.series = [
                   [
            name: "温度",
            data: [
                [-9.7, 9.4],
                [-8.7, 6.5],
                [-3.5, 9.4],
                [-1.4, 19.9],
                [0.0, 22.6],
                [2.9, 29.5],
                [9.2, 30.7],
                [7.3, 26.5],
                [4.4, 18.0],
                [-3.1, 11.4],
                [-5.2, 10.4],
                [-13.5, 9.8]
            ]
        ]
                    ];
```

7. Supported chart type for now 

```swift
enum AAChartType{
    case Column      = @"column";      //column chart
    case Bar         = @"bar";         //bar chart 
    case Area        = @"area";        //area chart 
    case Areaspline  = @"areaspline";  //areaspline chart
    case Line        = @"line";        //line chart
    case Spline      = @"spline";      //spline chart
    case Scatter     = @"scatter";     //scatter chart 
    case Pie         = @"pie";         //pie chart
    case Bubble      = @"bubble";      //bubble chart  
    case Pyramid     = @"pyramid";     //pyramid chart
    case Funnel      = @"funnel";      //funnel chart
    case Columnrange = @"columnrange"; //columnrange chart
}
```


8. Supported animation type for now

```swift
enum AAChartAnimationType:String{
    case Linear              = "linear" 
    case Swing               = "swing"
    case EaseInQuad          = "easeInQuad"
    case EaseOutQuad         = "easeOutQuad"
    case EaseInOutQuad       = "easeInOutQuad"
    case EaseInCubic         = "easeInCubic"
    case EaseOutCubic        = "easeOutCubic"
    case EaseInOutCubic      = "easeInOutCubic"
    case EaseInQuart         = "easeInQuart"
    case EaseOutQuart        = "easeOutQuart"
    case EaseInOutQuart      = "easeInOutQuart"
    case EaseInQuint         = "easeInQuint"
    case EaseOutQuint        = "easeOutQuint"
    case EaseInOutQuint      = "easeInOutQuint"
    case EaseInExpo          = "easeInExpo"
    case EaseOutExpo         = "easeOutExpo"
    case EaseInOutExpo       = "easeInOutExpo"
    case EaseInSine          = "easeInSine"
    case EaseOutSine         = "easeOutSine"
    case EaseInOutSine       = "easeInOutSine"
    case EaseInCirc          = "easeInCirc"
    case EaseOutCirc         = "easeOutCirc"
    case EaseInOutCirc       = "easeInOutCirc"
    case EaseInElastic       = "easeInElastic"
    case EaseOutElastic      = "easeOutElastic"
    case EaseInOutElastic    = "easeInOutElastic"
    case EaseInBack          = "easeInBack"
    case EaseOutBack         = "easeOutBack"
    case EaseInOutBack       = "easeInOutBack"
    case EaseInBounce        = "easeInBounce"
    case EaseOutBounce       = "easeOutBounce"
    case EaseInOutBounce     = "easeInOutBounce"
}




```
## Samples
- line chart

![IMG_1867.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1867.JPG)

- column chart

![IMG_1873.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1483.JPG)

-   bar chart

![IMG_1880.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1880.JPG
)

-  special area chart one 

![IMG_1869.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1482.JPG)

-  special area chart two

![IMG_1871.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1874.JPG)


-  special area chart three

![IMG_1863.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/PictureResources/屏幕快照%202017-05-06%20下午6.58.15.png)

-   radar chart

![IMG_1877.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1877.JPG
)

-   polar chart

![IMG_1879.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1879.JPG
)
-   pie chart

![IMG_1878.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1878.JPG
)

- the oval style column chart

![IMG_1866.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1866.JPG)

- bubble chart

![IMG_1875.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1875.JPG
)

- mixed chart

![IMG_1882.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1882.JPG)



### AAChartModel:chart attribute list
```swift
     public var animationType:String?       //
     public var title:String?               //
     public var subtitle:String?            //
     public var chartType:String?           //
     public var stacking:String?            //
     public var symbol:String?              //
     public var zoomType:String?            //
     public var inverted:Bool?              //
     public var xAxisReversed:Bool?         // 
     public var yAxisReversed:Bool?         //
     public var crosshairs:Bool?            //
     public var gradientColorEnable:Bool?   //
     public var polar:Bool?                 //
     public var dataLabelEnabled:Bool?      //
     public var xAxisLabelsEnabled:Bool?    //
     public var categories:Array<Any>?      //
     public var xAxisGridLineWidth:Int?     //
     public var yAxisLabelsEnabled:Bool?    //
     public var yAxisTitle:String?          //
     public var yAxisGridLineWidth:Int?     //
     public var colorsTheme:Array<Any>?     //
     public var series:Array<Any>?
     public var legendEnabled:Bool?         //
     public var legendLayout:String?        //
     public var legendAlign:String?         //
     public var legendVerticalAlign:String? //
     public var backgroundColor:String?     //
     public var options3dEnable:Bool?       //
     public var options3dAlpha:Int?
     public var  options3dBeta:Int?
     public var options3dDepth:Int?         //
     public var borderRadius:Int?           //
     public var markerRadius:Int?           //



```


###  Created By:
An An 
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

 

### LICENSE

AAInfographics is CAAopyright (c) 2017 An An and released as open source under the attached [MIT LICENSE](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/LICENSE).

### Postscript
If you want to shrink the size of the `AAInfographics` lib ,you should do something like this:
1. Delete the `.js` file of `AAJSFiles` folder in `AAInfographics`,The names of multiple files that need to be deleted are as follows

* AAJQueryLibrary.js 
* AAHighchartsLibrary.js
* AAHighchartsMore.js
* AAHighcharts-3d.js
* AAFunnel.js

2.Change the content of `AAChartView.html` file 
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
to be 

``` html
<script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
```
### Todo list
> * - [x] Support for the user to add delegate events after the graphics content loading was completed
> * - [x] Support graphics to refresh global content dynamically
> * - [x] Support graphics to refresh pure data (`series`) content dynamically
> * - [x] Support graphics to refresh pure data in real time and scroll dynamically
> * - [x] Support color layer gradient effects
> * - [x] Support 3D graphics effects, valid only for partial graphics such as `column chart、bar chart、pie charts、scatterplot chart、bubble chart`, etc
> * - [ ] Support horizontal screen (full screen) effect
> * - [ ] Support setting graphics rendering animation freely
> * - [ ] Support rendered graphics to generate image files
> * - [ ] Support generating image files saved to the system album
> * - [ ] Support for users to configure `AAOptions` model object properties freely
> * - [x] Support stacking the graphics 
> * - [x] Support reversing the graphics axis 
> * - [x] Support rendering the scatter chart
> * - [x] Support rendering the column range map
> * - [x] Support rendering the area range graph
> * - [ ] Support rendering the polar chart
> * - [ ] Support rendering the polyline straight line chart
> * - [ ] Support rendering the polyline straight area chart
> * - [ ] Support rendering the rectangular tree hierarchy diagrams
> * - [ ] Support rendering the circular progress bar chart 
> * - [ ] Support adding clicked event callbacks for graphics
