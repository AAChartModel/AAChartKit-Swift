 
# AAChartKit 2.0

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/LICENSE)&nbsp;
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)&nbsp;

### 查看网页版说明书`(附有交互式图表)`请点击链接
http://htmlpreview.github.io/?https://github.com/AAChartModel/AAChartKit/blob/master/AAChartKit/ChartsDemo/AAChartKitDocumentLive.html
***
## 前言
###### AAChartKit项目,是在流行的开源前端图表库*Highcharts*的基础上,封装的面向对象的,一组简单易用,极其精美的图表绘制控件.
1. 适配 `iOS 6`,  支持`ARC`,支持 `swift 3.0`语言,配置简单.
2. 功能强大,支持`柱状图`  `条形图`  `折线图`  `填充图` `雷达图` `扇形图` `气泡图`等多种图形
3. `动画`效果细腻精致,流畅优美.
4. 类 *Masonry* `链式编程语法` **(#warning:TODO)**
5. `AAChartView +AAChartModel = Chart`,在 AAChartKit 封装库当中,遵循这样一个极简主义公式:`图表视图控件+图表模型=你想要的图表`.
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
4.  绘制图形

```objective-c
[chartView aa_drawChartWithChartModel:chartModel];//图表视图对象调用图表模型对象,绘制最终图形
```
5.  刷新图形

```objective-c
 [chartView aa_refreshChartWithChartModel:chartModel];//更新 AAChartModel 数据之后,刷新图表
```

6. 特别说明

AAChartKit 中扇形图、气泡图都归属为特殊类型,所以想要绘制扇形图、气泡图,图表模型 AAChartModel 设置稍有不同,示例如下

- 绘制扇形图,你需要这样配置模型对象 **AAChartModel**
``` swift
    var chartModel = AAChartModel.init();
        chartModel.chartType = AAChartTypeColumnrange;
        chartModel.title = "编程语言热度;
        chartModel.subtitle = "虚拟数据";
        chartModel.yAxisTitle = "摄氏度";
        chartModel.dataLabelEnabled= true;//是否直接显示扇形图数据
        
        chartModel.series = 
        [
             {
            type: 'pie',
            name: '浏览器访问量占比',
            data: [
                ['Firefox',   45.0],
                ['IE',       26.8],
                {
                    name: 'Chrome',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['Safari',    8.5],
                ['Opera',     6.2],
                ['其他',   0.7]
            ]
        }
         ]          
                   
        ;
```
- 绘制气泡图,你需要这样配置模型对象 **AAChartModel**


``` swift
var chartModel = AAChartModel.init();
        chartModel.chartType = AAChartTypeColumnrange;
        chartModel.title = "编程语言热度;
        chartModel.subtitle = "虚拟数据";
        chartModel.yAxisTitle = "摄氏度";
        
        chartModel.series =
                   [
                     {
            name:'数据列 ONE',
            data: [
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
            ]},
                     
                     {
            name:'数据列 TWO',
            data: [
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
            ]},
                     
                     {
            name:'数据列 THREE',
            data: [
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
        }
                     ];
```

- 绘制柱形范围图,你需要这样配置模型对象 **AAChartModel**

``` swift
var chartModel = AAChartModel.init();
        chartModel.chartType = AAChartTypeColumnrange;
        chartModel.title = "编程语言热度;
        chartModel.subtitle = "虚拟数据";
        chartModel.yAxisTitle = "摄氏度";
        
        chartModel.series = 
                   [
                   {
            name: '温度',
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
        }

                   ];
```

7. 当前已支持的图表类型有十种以上,说明如下

```swift
enum AAChartType{
    static let AAChartTypeColumn      = "column"
    static let AAChartTypeBar         = "bar"
    static let AAChartTypeArea        = "area"
    static let AAChartTypeAreaSpline  = "areaspline"
    static let AAChartTypeLine        = "line"
    static let AAChartTypeSpline      = "spline"
    static let AAChartTypeScatter     = "scatter"
    static let AAChartTypePie         = "pie"
    static let AAChartTypeBubble      = "bubble"
    static let AAChartTypePyramid     = "pyramid"
    static let AAChartTypeFunnel      = "funnel"
    static let AAChartTypeColumnrange = "columnrange"
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
在 `AAChartKit` 封装库的初始设计中,为提升`.js`文件的加载速度,故将所依赖的`.js`文件放置在本地.然而由于本项目功能较多,故放置于本地的附加`JavaScript`文件库体积较大,整个`AAJSFiles`文件夹下所有的`.js`文件体积合计共有`5.3M左右`,若对工程文件体积大小较为敏感的使用者,可使用以下建议的替代方案
1.  删除在本`AAChartKit`项目文件中,`AAJSFiles`文件夹下的`5`项`.js`文件.需要被删除的文件名称如下
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

此方案是将原本加载放置在本地的`.js`依赖文件改为了加载放置在网络上的`.js`文件,减小了本地文件大小,但有可能会有一定的网络延迟(`0.5s以内`),所以建议`AAChartKit`用户可根据自己的实际项目的开发需要,酌情选择最终是否使用本替代方案.

