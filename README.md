 
# AAInfographics
 
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) 
[![](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/LICENSE) 
[![](https://img.shields.io/badge/language-Swift-green.svg)](https://github.com/AAChartModel/AAChartKit-Swift) 
[![](https://img.shields.io/badge/support-OC-orange.svg)](https://github.com/AAChartModel/AAChartKit) 
### 中文使用说明书地址
https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md
 
***
## Features:
1. Support `iOS 8`、`ARC` & `Swift`.
2. Powerful,support the  `column chart` `bar chart` `line chart` `spline chart` `pie chart` `polar chart` `radar chart` and other graphics.
3. Interactive、animated,the `animation` is exquisite and deligate.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAInfographics,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`.  
***


## Method of use:

### The need of preparation
1. Drag the folder `AAInfographicsFiles` into your project.
  

### The offical start of the work 
1.Add the following content into `your view controller` file.
```swift
import AAChartView.swift
```
2.Creat the object of chart view:`AAChartView`
```swift
         if let htmlFile = Bundle.main.path(forResource: "AAChartView", ofType: "html"){
             let htmlData = NSData(contentsOfFile: htmlFile)
             let baseURL = NSURL.fileURL(withPath: Bundle.main.bundlePath)
             globalWebview = UIWebView()
            globalWebview?.frame = CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height)
             globalWebview?.delegate=self;
            self.view.addSubview(globalWebview!)
             globalWebview?.load(htmlData! as Data, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
         }
 ```
3.Configure the properties of chart model:`AAChartModel`

``` swift
    var chartModel = AAChartModel.init();
        chartModel.chartType = "column";
        chartModel.title = "你是人间四月天";
        chartModel.subtitle="你是爱是暖";
        chartModel.inverted = true;
        chartModel.yAxisTitle = "千万公顷";
        chartModel.legendEnabled = true;
        let modelString = chartModel.toJSON();
        
        let jsString = NSString.localizedStringWithFormat("loadTheHighChartView('%@','%f','%f');", modelString!,self.view.frame.size.width,self.view.frame.size.height);
        
        globalWebview?.stringByEvaluatingJavaScript(from: jsString as String);
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
- -  To draw a bubble chart,you should configure the properties of `AAChartModel` like this:


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
        [9, 81, 63],
        [98, 5, 89],
        [51, 50, 73],
        [41, 22, 14],
        [58, 24, 20],
        [78, 37, 34],
        [55, 56, 53],
        [18, 45, 70],
        [42, 44, 28],
        [3, 52, 59],
        [31, 18, 97],
        [79, 91, 63],
        [93, 23, 23],
        [44, 83, 22]
        ]],
        
        [
        "name":"数据列 TWO",
        "data": [
        [42, 38, 20],
        [6, 18, 1],
        [1, 93, 55],
        [57, 2, 90],
        [80, 76, 22],
        [11, 74, 96],
        [88, 56, 10],
        [30, 47, 49],
        [57, 62, 98],
        [4, 16, 16],
        [46, 10, 11],
        [22, 87, 89],
        [57, 91, 82],
        [45, 15, 98]
        ]],
        
        [
        "name":"数据列 THREE",
        "data": [
        [47, 47, 21],
        [20, 12, 4],
        [6, 76, 91],
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

- -  To draw a columnrange chart,you should configure the properties of `AAChartModel` like this:

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
    static let AAChartTypeColumn      = @"column";      //column chart
    static let AAChartTypeBar         = @"bar";         //bar chart 
    static let AAChartTypeArea        = @"area";        //area chart 
    static let AAChartTypeAreaspline  = @"areaspline";  //areaspline chart
    static let AAChartTypeLine        = @"line";        //line chart
    static let AAChartTypeSpline      = @"spline";      //spline chart
    static let AAChartTypeScatter     = @"scatter";     //scatter chart 
    static let AAChartTypePie         = @"pie";         //pie chart
    static let AAChartTypeBubble      = @"bubble";      //bubble chart  
    static let AAChartTypePyramid     = @"pyramid";     //pyramid chart
    static let AAChartTypeFunnel      = @"funnel";      //funnel chart
    static let AAChartTypeColumnrange = @"columnrange"; //columnrange chart
}
```


8. Supported animation type for now

```swift
enum AAChartAnimationType:String{
    case
    AAChartAnimationTypeLinear              = "linear" ,
    AAChartAnimationTypeSwing               = "swing",
    AAChartAnimationTypeEaseInQuad          = "easeInQuad",
    AAChartAnimationTypeEaseOutQuad         = "easeOutQuad",
    AAChartAnimationTypeEaseInOutQuad       = "easeInOutQuad",
    AAChartAnimationTypeEaseInCubic         = "easeInCubic",
    AAChartAnimationTypeEaseOutCubic        = "easeOutCubic",
    AAChartAnimationTypeEaseInOutCubic      = "easeInOutCubic",
    AAChartAnimationTypeEaseInQuart         = "easeInQuart",
    AAChartAnimationTypeEaseOutQuart        = "easeOutQuart",
    AAChartAnimationTypeEaseInOutQuart      = "easeInOutQuart",
    AAChartAnimationTypeEaseInQuint         = "easeInQuint",
    AAChartAnimationTypeEaseOutQuint        = "easeOutQuint",
    AAChartAnimationTypeEaseInOutQuint      = "easeInOutQuint",
    AAChartAnimationTypeEaseInExpo          = "easeInExpo",
    AAChartAnimationTypeEaseOutExpo         = "easeOutExpo",
    AAChartAnimationTypeEaseInOutExpo       = "easeInOutExpo",
    AAChartAnimationTypeEaseInSine          = "easeInSine",
    AAChartAnimationTypeEaseOutSine         = "easeOutSine",
    AAChartAnimationTypeEaseInOutSine       = "easeInOutSine",
    AAChartAnimationTypeEaseInCirc          = "easeInCirc",
    AAChartAnimationTypeEaseOutCirc         = "easeOutCirc",
    AAChartAnimationTypeEaseInOutCirc       = "easeInOutCirc",
    AAChartAnimationTypeEaseInElastic       = "easeInElastic",
    AAChartAnimationTypeEaseOutElastic      = "easeOutElastic",
    AAChartAnimationTypeEaseInOutElastic    = "easeInOutElastic",
    AAChartAnimationTypeEaseInBack          = "easeInBack",
    AAChartAnimationTypeEaseOutBack         = "easeOutBack",
    AAChartAnimationTypeEaseInOutBack       = "easeInOutBack",
    AAChartAnimationTypeEaseInBounce        = "easeInBounce",
    AAChartAnimationTypeEaseOutBounce       = "easeOutBounce",
    AAChartAnimationTypeEaseInOutBounce     = "easeInOutBounce"
};



```
## Samples
- line chart

![IMG_1867.JPG](http://upload-images.jianshu.io/upload_images/2412088-98b871988b57d435.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- column chart

![IMG_1873.JPG](http://upload-images.jianshu.io/upload_images/2412088-c791a9a5bee44502.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

-   bar chart

![IMG_1880.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1880.JPG
)

-  special area chart one 

![IMG_1871.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1874.JPG)
-  special area chart two

![IMG_1869.JPG](http://upload-images.jianshu.io/upload_images/2412088-d089326452b19a11.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
-  special area chart three

![IMG_1863.JPG](http://upload-images.jianshu.io/upload_images/2412088-dbbcf79f7946bb96.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

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

![IMG_1866.JPG](http://upload-images.jianshu.io/upload_images/2412088-4e2e142fc4bae5c2.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- bubble chart

![IMG_1875.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1875.JPG
)



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

