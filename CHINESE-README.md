 
# AAInfographics

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/LICENSE)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;
[![](https://img.shields.io/badge/language-OC-green.svg)](https://github.com/AAChartModel/AAChartKit)&nbsp;
[![](https://img.shields.io/badge/support-Swift-orange.svg)](https://github.com/AAChartModel/AAChartKit-Swift)&nbsp;

 
***
## 前言
###### **AAInfographics**,是 `AAChartKit` 的 `swift`语言版本,是在流行的开源前端图表库*Highcharts*的基础上,封装的面向对象的,一组简单易用,极其精美的图表绘制控件.
1. 适配 `iOS 8`,  支持`ARC`,支持 `swift 3.0`语言,配置简单.
2. 功能强大,支持`柱状图`  `条形图`  `折线图`  `填充图` `雷达图` `扇形图` `气泡图`等多种图形
3. `动画`效果细腻精致,流畅优美.
4. 类 *Masonry* `链式编程语法`
5. `AAChartView +AAChartModel = Chart`,在 AAInfographics 封装库当中,遵循这样一个极简主义公式:`图表视图控件+图表模型=你想要的图表`.
### *亲爱的,如果您使用时,觉得满意,请赏一颗星星✨,您的鼓励将是我继续努力的一大动力*.
***

## 使用方法

### 准备工作
* 将项目demo中的文件夹`AAChartKitFiles`拖入到所需项目中.
 

### 正式开始
1. 在你的视图控制器文件中添加
```swift
import AAChartView.swift
```
2. 创建视图AAChartView
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
3. 配置视图模型AAChartModel

* 常规方式配置 AAChartModel 模型对象属性
``` swift
    var chartModel = AAChartModel.init();
        chartModel.chartType = "column";
        chartModel.title = "你是人间四月天";
        chartModel.subtitle="你是爱是暖";
        chartModel.inverted = true;
        chartModel.yAxisTitle = "千万公顷";
        chartModel.legendEnabled = true;
        chartModel.series = [
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
                ]];
```

* 链式编程的方式配置 AAChartModel 模型对象属性
```swift
        let chartModel = AAChartModel.init()
            .chartTypeSet(self.chartType!)
            .animationTypeSet("donghualeixing")
            .titleSet("donghua")
            .animationTypeSet("jiushizheyang")
            .seriesSet([
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
                ]]);
```

4.  绘制图形

```swift
chartView?.aa_drawChartWithChartModel(chartModel)//图表视图对象调用图表模型对象,绘制最终图形
```
5.  刷新图形

```swift
chartView?.aa_refreshChartWithChartModel(chartModel)//更新 AAChartModel 数据之后,刷新图表
```

6. 特别说明

AAInfographics 中扇形图、气泡图都归属为特殊类型,所以想要绘制扇形图、气泡图,图表模型 AAChartModel 设置稍有不同,示例如下

- 绘制扇形图,你需要这样配置模型对象 **AAChartModel**
``` swift
                var chartModel = AAChartModel.init();
        chartModel.chartType = AAChartTypeColumnrange;
        chartModel.title = "编程语言热度";
        chartModel.subtitle = "虚拟数据";
        chartModel.yAxisTitle = "摄氏度";
        chartModel.dataLabelEnabled = true;//是否直接显示扇形图数据
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
- 绘制气泡图,你需要这样配置模型对象 **AAChartModel**


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

- 绘制柱形范围图,你需要这样配置模型对象 **AAChartModel**

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

7. 当前已支持的图表类型有十种以上,说明如下

```swift
enum AAChartType{
    static let AAChartTypeColumn      = "column"      //柱形图
    static let AAChartTypeBar         = "bar"         //条形图
    static let AAChartTypeArea        = "area"        //折线区域填充图
    static let AAChartTypeAreaSpline  = "areaspline"  //曲线区域填充图
    static let AAChartTypeLine        = "line"        //折线图
    static let AAChartTypeSpline      = "spline"      //曲线图
    static let AAChartTypeScatter     = "scatter"     //散点图
    static let AAChartTypePie         = "pie"         //扇形图
    static let AAChartTypeBubble      = "bubble"      //气泡图
    static let AAChartTypePyramid     = "pyramid"     //金字塔图
    static let AAChartTypeFunnel      = "funnel"      //漏斗图
    static let AAChartTypeColumnrange = "columnrange" //柱形范围图
}
```


8. 当前已支持的图表渲染动画类型有十种以上,说明如下

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
### AAChartModel 属性列表
```swift
     public var animationType:String?       //动画类型
     public var title:String?               //标题内容
     public var subtitle:String?            //副标题内容
     public var chartType:String?           //图表类型
     public var stacking:String?            //堆积样式
     public var symbol:String?              //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
     public var zoomType:String?            //缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
     public var inverted:Bool?              //x 轴是否垂直
     public var xAxisReversed:Bool?         // x 轴翻转
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
     public var series:Array<Any>?
     public var legendEnabled:Bool?         //是否显示图例
     public var legendLayout:String?        //图例数据项的布局。布局类型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默认是：horizontal.
     public var legendAlign:String?         //设定图例在图表区中的水平对齐方式，合法值有left，center 和 right。
     public var legendVerticalAlign:String? //设定图例在图表区中的垂直对齐方式，合法值有 top，middle 和 bottom。垂直位置可以通过 y 选项做进一步设定。
     public var backgroundColor:String?   //图表背景色
     public var options3dEnable:Bool?       //是否3D化图形(仅对条形图,柱状图有效)
     public var options3dAlpha:Int?
     public var  options3dBeta:Int?
     public var options3dDepth:Int?         //3D图形深度
     public var borderRadius:Int?           //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
     public var markerRadius:Int?           //折线连接点的半径长度



```
###  AAChartModel一些重要属性经过配置之后的图形示例如下
- line chart - 折线图

![IMG_1867.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1867.JPG)
- column chart - 柱形图

![IMG_1873.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1483.JPG)

-   bar chart - 条形图

![IMG_1880.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1880.JPG
)

-  special area chart one - 区域填充图一

![IMG_1869.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1482.JPG)
-  special area chart two - 区域填充图二
![IMG_1871.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1874.JPG)


-  special area chart three - 区域填充图三

![IMG_1863.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1863.JPG)

-   radar chart - 雷达图

![IMG_1877.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1877.JPG
)

-   polar chart - 极地图

![IMG_1879.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1879.JPG
)
-   pie chart - 扇形图

![IMG_1878.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1878.JPG
)

- the oval style column chart - 头部为椭圆形的柱形图

![IMG_1866.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1866.JPG)
- bubble chart - 气泡图

![IMG_1875.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1875.JPG
)

- mixed chart - 混合图形
![IMG_1882.JPG](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/IMG_1882.JPG)

### 作者
An An 
``` java
 "CODE IS FAR AWAY FROM BUG WITH THE ANIMAL PROTECTING"
 *            %%3      %%3
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

### 许可证
本项目使用 MIT许可证,详情请点击[MIT LICENSE](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/LICENSE)

### 附言
在 `AAInfographics` 封装库的初始设计中,为提升`.js`文件的加载速度,故将所依赖的`.js`文件放置在本地.然而由于本项目功能较多,故放置于本地的附加`JavaScript`文件库体积较大,整个`AAJSFiles`文件夹下所有的`.js`文件体积合计共有`5.3M左右`,若对工程文件体积大小较为敏感的使用者,可使用以下建议的替代方案
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

