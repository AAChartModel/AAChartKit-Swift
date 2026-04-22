  ![AAInfographics-LOGO]( https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/AAInfographics-Logo.png)
# AAInfographics

 
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) </br>
[![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE)</br>
[![](https://img.shields.io/badge/language-Swift-green.svg)](https://github.com/AAChartModel/AAChartKit-Swift) </br>
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md#当前已支持的图表渲染动画类型有三十种以上说明如下)</br>
[![](https://img.shields.io/badge/support-OC-orange.svg)](https://github.com/AAChartModel/AAChartKit)</br>
[![](https://jaywcjlove.github.io/sb/lang/chinese.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md)</br>
[![](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/AAChartModel/AAChartKit-Swift)</br>
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/AAChartModel/AAChartKit-Swift.svg)](http://isitmaintained.com/project/AAChartModel/AAChartKit-Swift "Average time to resolve an issue")</br>
[![Percentage of issues still open](http://isitmaintained.com/badge/open/AAChartModel/AAChartKit-Swift.svg)](http://isitmaintained.com/project/AAChartModel/AAChartKit-Swift "Percentage of issues still open")


## [ **English Document 🇬🇧** ](https://github.com/AAChartModel/AAChartKit-Swift)  |  [ **简体中文文档 🇨🇳** ](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md)

### 您所喜爱的`AAInfographics`开源图表框架同时更有`Objective-C`版本可供使用,详情请点击以下链接
### 传送门
#### *https://github.com/AAChartModel/AAChartKit*

## 前言

 ***AAInfographics***,是 [AAChartKit](https://github.com/AAChartModel/AAChartKit) 的 `swift`语言版本, 是在流行的开源前端图表框架*Highcharts*的基础上, 封装的一组优雅易用, 极其精美的声明式数据可视化工具集. 可能是这个星球上 UI 最精致的第三方 iOS 开源图表框架了(✟我以无神论者的名义向上帝起誓🖐,我真的没有在说鬼话✟)

***
## 功能特性

* 🎂        **环境友好,兼容性强**. 适配 `iOS 9 +`, 支持`iOS`、`iPad OS`、及 `macOS`,  支持 `Swift`语言, 同时更有 `Objective-C` 语言版本 [AAChartKit](https://github.com/AAChartModel/AAChartKit) 、 `Java` 语言版本 [AAChartCore](https://github.com/AAChartModel/AAChartCore) 、`Kotlin` 语言版本 [AAChartCore-Kotlin](https://github.com/AAChartModel/AAChartCore-Kotlin) 可供使用, 配置导入工程简单易操作. 支持的所有语言版本及连接,参见此[列表](#源代码).

* 🚀        **功能强大,类型多样**. 支持`柱状图` 、`条形图` 、`折线图` 、`曲线图` 、`折线填充图` 、`曲线填充图`、`直方折线图`、`直方折线填充图`、`雷达图`、`极地图`、`饼图`、`环形图`、`扇形图`、`气泡图`、`密集气泡图`、`散点图`、`区域范围图`、`柱形范围图`、`面积范围图`、`面积范围均线图`、`箱线图`、`瀑布图`、`金字塔图`、`漏斗图`、`金字塔柱状图`、`多边形图`、`仪表图`、`误差图`、`常规堆积图`、`百分比堆积图`、`混合图`、等二十几种类型的图表, 不可谓之不多.

* 📝        **现代化声明式语法**. 与过往的命令式编程技巧不同, 在 AAChartKit 中绘制任意一款自定义图表, 你完全无需关心挠人的内在实现细节. 描述你所要得到的, 你便得到你所描述的.

* 🔬        **细致入微的用户自定义功能**. 基础的`主标题`、`副标题`、`X 轴`、`Y 轴`自不必谈, 从纵横的`交互准星线`、跟手的`浮动提示框`, 到切割数值的`值域分割颜色线`、`值域分割颜色带`, 再到细小的`线条`类型,`标记点`样式,  各种细微的图形子组件, 应有尽有. 以至于不论是`极简`、抽象的小清新风格, 还是纷繁`复杂`的严肃商业派头, 均可完美驾驭.

* 🎮        **交互式图形动画**. 有着清晰和充满细节的用户交互方式,与此同时,图形渲染`动画`效果细腻精致,流畅优美.有三十多种以上渲染动画效果可供选择,用户可自由设置渲染图形时的动画时间和动画类型,关于图形渲染动画类型,具体参见[ AAInfographics 动画类型](#当前已支持的图表渲染动画类型有三十种以上).

* 🦋        **极简主义**. `AAChartView + AAChartModel = Chart`,在 ***AAInfographics*** 数据可视化图形框架当中,遵循这样一个极简主义公式:`图表视图控件 + 图表模型 = 你想要的图表`.同另一款强大、精美而又易用的开源图形框架 [AAChartKit](https://github.com/AAChartModel/AAChartKit)完全一致.

* ⛓        **链式编程语法**. 支持类 *Masonry* `链式编程语法`, 一行代码即可配置完成 `AAChartModel`模型对象实例.

* 🎈        **简洁清晰,轻便易用**. 最少仅仅需要 **五行代码** 即可完成整个图表的绘制工作(使用链式编程语法配置 `AAChartModel` 实例对象时,无论你写多少行代码,理论上只能算作是一行). 😜😜😜

* 🖱        **支持点击事件**. 支持监听用户交互事件, 可在此基础上实现双表联动乃至多表联动, 以及其他更多更复杂的自定义用户交互效果. 具体参见[支持监听用户点击事件及单指滑动事件](#支持监听用户点击事件及单指滑动事件)

* 👌        **支持手势缩放**. 支持图表的手势缩放和拖动阅览, 手势缩放类型具体参见[ AAInfographics 手势缩放类型](#当前已支持的图表手势缩放类型共有三种说明如下), 默认禁用手势缩放功能.

***





## 真机美图

<div>
<img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/ColumnChart.png' width="33%">
<img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/BarChart.png' width="33%">
<img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/AreaChart.png' width="33%">
</div>

<div>
<img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/LineChart.png' width="33%">
<img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/StepAreaChart.png' width="33%">
<img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/StepLineChart.png' width="33%">
</div>

<div>
<img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/splineChart.png' width="33%">
<img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/areasplineChart.png' width="33%">
<img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/percentStackingAreasplineChart.png' width="33%">
</div>

<div>
<img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/BubbleChart.png' width="33%">
<img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/ArearangeAverageValueChart.png' width="33%">
<img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/ColumnMixedLineChart.png' width="33%">
</div>

<div>
<img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/scatterChart.png' width="33%">
<img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/boxplotChart.png' width="33%">
<img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/MirrorColumnChart.png' width="33%">
</div>


## 安装

### 使用 CocoaPods (推荐)

1. 添加 
```ruby
pod 'AAInfographics', :git => 'https://github.com/AAChartModel/AAChartKit-Swift.git'

```
 到你的 **Podfile** 文件当中.
 
2. 在终端中运行命令 `pod install` or `pod update`.
3. 导入头文件  `AAInfographics`.

### 使用 Swift Package Manager

1. 在 Xcode 中选择 `File > Add Package Dependencies...`
2. 输入仓库地址:
```text
https://github.com/AAChartModel/AAChartKit-Swift.git
```
3. 选择 `9.5.0` 或更高版本.
4. 将 `AAInfographics` product 添加到你的 target.

如果你使用 `Package.swift`, 可以这样配置:

```swift
dependencies: [
    .package(url: "https://github.com/AAChartModel/AAChartKit-Swift.git", from: "9.5.0")
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "AAInfographics", package: "AAChartKit-Swift")
        ]
    )
]
```

### 使用 Carthage

1. 添加 
```ruby
github "https://github.com/AAChartModel/AAChartKit-Swift.git" ~> 9.5

```
 到你的 **Cartfile** 文件当中.
 
2. 在终端中运行命令 `carthage bootstrap --use-xcframeworks` 或 `carthage update --use-xcframeworks`.
3. 将 `AAInfographics.xcframework` 链接到你的 app target.
4. 导入头文件 `AAInfographics`.

### 手动安装

1. 下载 Demo  `AAInfographicsDemo`
2. 将 Demo 中的名为`AAInfographics` 的文件夹拖入至你的项目之中.


## 使用方法

1. 创建视图*AAChartView*
```swift
        let chartViewWidth  = self.view.frame.size.width
        let chartViewHeight = self.view.frame.size.height
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x: 0,
                                    y: 60,
                                    width: chartViewWidth,
                                    height: chartViewHeight)
        // 设置 aaChartView 的内容高度(content height)
        // aaChartView?.contentHeight = self.view.frame.size.height
        self.view.addSubview(aaChartView!)
 ```
2. 配置视图模型*AAChartModel*

* 链式编程的方式配置 *AAChartModel* 模型对象属性
```swift
    let chartModel = AAChartModel()
            .chartType(.area)//图表类型
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
                AASeriesElement()
                    .name("东京")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
                AASeriesElement()
                    .name("纽约")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
                AASeriesElement()
                    .name("柏林")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
                AASeriesElement()
                    .name("伦敦")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]),
                    ])
```

3.  绘制图形(创建 AAChartView 实例对象后,首次绘制图形调用此方法)

```swift
    /*图表视图对象调用图表模型对象,绘制最终图形*/
    aaChartView?.aa_drawChartWithChartModel(aaChartModel)
```

🎉🎉🎉  好了,至此,有关于绘制图形的任务,一切皆已经搞定!!! 你将得到你想要的任意图形!!! 🌈🌈🌈

### 更新图形内容
如果你需要更新图表内容,你应该阅读以下内容,根据你的实际需要,选择调用适合你的函数

* 仅仅刷新图形的`series`数据内容(首次绘制图形完成之后,后续刷新图表数据均建议调用此方法)

```swift
    /*仅仅更新了图表的series数组数据,不改动图表的其他内容*/
    aaChartView?.aa_onlyRefreshTheChartDataWithChartModelSeries(chartModelSeriesArray)
```

*   刷新图形除数据属性 `series` 以外的其他属性(首次绘制图形完成之后,后续刷新图表的属性均建议调用此方法 注意:仅仅刷新图形数据,则建议使用上面的👆`aa_onlyRefreshTheChartDataWithChartModelSeries`方法)

```swift
    /*更新 AAChartModel 整体内容(如修改了图表的类型,将 column chart 改为 area chart)之后,刷新图表*/
    aaChartView?.aa_refreshChartWholeContentWithChartModel(aaChartModel)
```


##  **AAChartModel**一些重要属性经过配置之后的图形示例如下

- ### line chart - 折线图

![line chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/LineChart.png)

- ### column chart - 柱形图

![IMG_1873.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ColumnChart.png)

- ### bar chart - 条形图

![bar chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/BarChart.png)

- ### special area chart one - 常规折线区域填充图

![IMG_1869.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/IMG_1482.JPG)

- ### special area chart two - 带有负数的区域填充图

![IMG_1871.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/AreaChartOne.png))

- ### special area chart three - 堆积效果的区域填充图

![IMG_1863.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/AreaChartTwo.png)

- ### polar chart - 极地图

![polar chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/PolarChart.png)

- ### radar chart - 雷达图

![radar chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/RadarChart.png)

- ### pie chart - 扇形图

![pie chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/PieChart.png)

- ### bubble chart - 气泡图

![bubble chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/BubbleChart.png)

- ### scatter chart - 散点图

![scatter chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ScatterChart.png)

- ### arearange chart - 区域范围图

![arearange chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ArearangeChart.png)

- ### step area chart - 直方折线填充图

![step area chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/StepAreaChart.png)

- ### mixed chart - 混合图形

![mixed chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/MixedChart.png)


### 更多图形效果
注意:如下的这幅`DEMO演示图`为大小*6M*左右的`GIF动态图`,如未显示动态效果则说明图片资源未全部加载。请耐心等待至图片资源内容完全加载结束后，即可最终观赏更多的项目的动态演示效果.

![AAChartKit-Live](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/AAChartKit-Live.gif)


## 特别说明

### 支持监听用户点击事件及单指滑动事件

  可通过给 AAChartView 实例对象设置代理方法,来实现监听用户的点击事件(click)或者单指掠过事件(move over)
 ```swift
    //设置 AAChartView 事件代理
    aaChartView!.delegate = self as AAChartViewDelegate


    //实现对 AAChartView 事件代理的监听
extension BasicChartVC: AAChartViewDelegate {
    //监听用户的点击事件(click)
    open func aaChartView(_ aaChartView: AAChartView, clickEventMessage: AAClickEventMessageModel) {
        print(
            """

            clicked point series element name: \(clickEventMessage.name ?? "")
            🖱🖱🖱WARNING!!!!!!!!!!!!!!!!!!!! Click Event Message !!!!!!!!!!!!!!!!!!!! WARNING🖱🖱🖱
            ==========================================================================================
            ------------------------------------------------------------------------------------------
            user finger moved over!!!,get the move over event message: {
            category = \(String(describing: clickEventMessage.category))
            index = \(String(describing: clickEventMessage.index))
            name = \(String(describing: clickEventMessage.name))
            offset = \(String(describing: clickEventMessage.offset))
            x = \(String(describing: clickEventMessage.x))
            y = \(String(describing: clickEventMessage.y))
            }
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            
            
            """
        )
    }

    //监听用户的单指掠过事件(move over)
    open func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
        print(
            """

            moved over point series element name: \(moveOverEventMessage.name ?? "")
            ✋🏻✋🏻✋🏻✋🏻✋🏻WARNING!!!!!!!!!!!!!! Move Over Event Message !!!!!!!!!!!!!! WARNING✋🏻✋🏻✋🏻✋🏻✋🏻
            ==========================================================================================
            ------------------------------------------------------------------------------------------
            user finger moved over!!!,get the move over event message: {
            category = \(String(describing: moveOverEventMessage.category))
            index = \(String(describing: moveOverEventMessage.index))
            name = \(String(describing: moveOverEventMessage.name))
            offset = \(String(describing: moveOverEventMessage.offset))
            x = \(String(describing: moveOverEventMessage.x))
            y = \(String(describing: moveOverEventMessage.y))
            }
            +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            
            
            """
        )
    }
}
  ```

  在监听用户交互事件时,获取的点击事件信息`AAClickEventMessageModel`和单指掠过事件信息`AAMoveOverEventMessageModel`, 内容如下:
  ```swift
    public class AAEventMessageModel: NSObject {
        public var name: String?
        public var x: Float?
        public var y: Float?
        public var category: String?
        public var offset: [String: Any]?
        public var index: Int?
}

    public class AAClickEventMessageModel: AAEventMessageModel {}

    public class AAMoveOverEventMessageModel: AAEventMessageModel {}
  ```
  
  监听用户点击事件可实现多种多样的自定义功能. 例如可通过用户点击事件回调来实现**双表联动**, 示例效果如下
  
  ![doubleChartsLinkage](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/doubleChartsLinkage.gif)



### 支持通过`JavaScript` 函数来自定义 `AATooltip`视图显示效果
有时系统默认的 tooltip 浮动提示框的显示效果无法满足使用者的特殊自定义要求,此时可以通过添加 AATooltip 的 `headerFormat`、`footerFormat` 和 `pointFormat` 的字符串属性的`HTML`文本内容,来自定义浮动提示框的显示内容,此三者可以胜任绝大数情况下的自定义浮动提示框 AATooltip 的任务.

如仍旧不能满足需求,更可以通过 AATooltip 的 `formatter` 函数来实现视图的特殊定制化 例如,如下配置 AATooltip 实例对象属性
```swift
        //custom tooltip style
        let aaTooltip = AATooltip()
            .useHTML(true)
            .formatter("""
function () {
        return ' 🌕 🌖 🌗 🌘 🌑 🌒 🌓 🌔 <br/> '
        + ' Support JavaScript Function Just Right Now !!! <br/> '
        + ' The Gold Price For <b>2020 '
        +  this.x
        + ' </b> Is <b> '
        +  this.y
        + ' </b> Dollars ';
        }
""")
            .valueDecimals(2)//设置取值精确到小数点后几位//设置取值精确到小数点后几位
            .backgroundColor("#000000")
            .borderColor("#000000")
            .style(
                AAStyle()
                    .color("#FFD700")
                    .fontSize(12)
                    )
          
```
即可完成图表的浮动提示框的特殊定制化.得到的自定义浮动提示框的视觉效果图如下👇
![Custom Tooltip Style](https://user-images.githubusercontent.com/16357599/56589690-543c5880-6618-11e9-9d18-6bc0fe2fa53f.png)

### 支持添加值域分割功能⚔

* 添加值域分割颜色带 `plotBands 🎀`
![plotBandsChart](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/plotBandsChart.png)


* 添加值域分割颜色线 `plotLines 🧶`
![plotLinesChart](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/plotLinesChart.png)


* 添加值域分割数据列分区 `zones 🧱`
![plotLinesChart](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/seriesZonesChart.png)

### 支持图表数据的动态滚动刷新

<div  >
   <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/scrollingUpdateColumnChart.gif' >
   <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/scrollingUpdateLineChart.gif' >
   <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/scrollingUpdateStepAreaChart.gif' >
</div>

### 支持图表数据的动态排序

<div  >
   <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/DataSortingColumnChart.gif' >
   <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/DataSortingScatterChart.gif' >
   <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/DataSortingBarChart.gif' >
</div>



### 当前已支持的图表类型有十种以上,说明如下

```swift
enum AAChartType: String {
    case column          = "column"          //柱形图
    case bar             = "bar"             //条形图
    case area            = "area"            //折线区域填充图
    case areaspline      = "areaspline"      //曲线区域填充图
    case line            = "line"            //折线图
    case spline          = "spline"          //曲线图
    case scatter         = "scatter"         //散点图
    case pie             = "pie"             //扇形图
    case bubble          = "bubble"          //气泡图
    case packedbubble    = "packedbubble"    //密集气泡图
    case pyramid         = "pyramid"         //金字塔图
    case columnpyramid   = "columnpyramid"   //金字塔柱状图
    case funnel          = "funnel"          //漏斗图
    case columnrange     = "columnrange"     //柱形范围图
    case arearange       = "arearange"       //折线区域范围图
    case areasplinerange = "areasplinerange" //曲线区域范围图
    case boxplot         = "boxplot"         //箱线图
    case waterfall       = "waterfall"       //瀑布图
    case polygon         = "polygon"         //多边形图
    case gauge           = "gauge"           //仪表图
    case errorbar        = "errorbar"        //误差图
}
```

### 当前已支持的图表手势缩放类型共有三种,说明如下

```swift
enum AAChartZoomType: String {
    case none = "none"   //禁用图表手势缩放功能(默认禁用手势缩放)
    case x    = "x"      //支持图表 X 轴横向缩放
    case y    = "y"      //支持图表 Y 轴纵向缩放
    case xy   = "xy"     //支持图表等比例缩放
}
```


NOTE:例如,设置了`AAChartModel`的缩放属性`zoomType`为`AAChartZoomType.X`,并且将图表进行了 X 轴水平方向手势放大之后,这时候如果想要左右滑动图表,可以使用 **双指点按** 屏幕中的`AAChartView`视图区域进行 **左右拖动** 即可.同时屏幕的右上角会自动出现一个标题为 **"恢复缩放"** 的按钮,点击恢复缩放,图表大小和位置将会回归到原初的样式.


### 当前已支持的图表线条类型共有十一种,说明如下

```swift
public enum AAChartLineDashStyleType: String {
    case solid           //———————————————————————————————————
    case shortDash       //— — — — — — — — — — — — — — — — — —
    case shortDot        //ⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈⵈ
    case shortDashDot    //—‧—‧—‧—‧—‧—‧—‧—‧—‧—‧—‧—‧—‧—‧—‧—‧—‧—‧
    case shortDashDotDot //—‧‧—‧‧—‧‧—‧‧—‧‧—‧‧—‧‧—‧‧—‧‧—‧‧—‧‧—‧‧
    case dot             //‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧‧
    case dash            //—— —— —— —— —— —— —— —— —— —— —— ——
    case longDash        //——— ——— ——— ——— ——— ——— ——— ——— ———
    case dashDot         //——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧——‧
    case longDashDot     //———‧———‧———‧———‧———‧———‧———‧———‧———‧
    case longDashDotDot  //———‧‧———‧‧———‧‧———‧‧———‧‧———‧‧———‧‧
}
```

### 当前已支持的图表渲染动画类型有三十种以上

以下是**AAInfographics**其中十种图表渲染动画类型

| Back      | Bounce    | Circ      | Cubic     | Elastic   |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![][1]    | ![][2]    | ![][3]    | ![][4]    | ![][5]    |


| Expo      | Quad      | Quart     | Quint     | Sine      |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![][6]    | ![][7]    | ![][8]    | ![][9]    | ![][10]   |


## 关于`AAChartModel` 属性说明

* ### AAChartModel 主要属性说明

属性名称 | 属性类型 | 描述 | 取值范围 | 
------------ | ------------- | ------------- | ------------- |
title | String | 图表主标题 | 任意有效的字符串 | 
subtitle | String |图表副标题  | 任意有效的字符串 |
chartType | AAChartType |  图表类型,可以为`AAChartType`枚举字符串当中指定的任意有效类型.其中有支持`柱状图` 、`条形图` 、`折线图` 、`曲线图` 、`折线填充图` 、`曲线填充图`、`雷达图`、`扇形图`、`气泡图`、`散点图`、`金字塔图`、`漏斗图`、`区域范围图`、`柱形范围图`等多种图形  | .column,  .bar,  .area,  .areaSpline,  .line,  .spline,  .pie,  .bubble,  .scatter,  .pyramid,  .funnel,  .areaRange,  .columnRange |  
stacking| AAChartStackingType | 是否将图表每个数据列的值叠加在一起。 默认的值为`.none`， 即禁用堆叠样式效果.另有常规堆叠样式和百分比堆叠样式可供选择 | .none,  .normal,  .percent | 
symbol | AAChartSymbolType | 预定义的图表曲线连接点的样式类型.其可供选择的值有`圆`、`正方形`、`钻石`、`常规三角形`和`倒三角形`,默认为混合样式 | .circle,  .square,  .diamond,  .triangle,  .triangleDown | 

* ### AAChartModel 所有属性列表说明
```swift
public class AAChartModel: AAObject {
    public var animationType: AAChartAnimationType?        //动画类型
    public var animationDuration: Int?                     //动画时间
    public var title: String?                              //标题内容
    public var titleFontColor: String?                     //标题字体颜色
    public var titleFontSize: Float?                       //标题字体大小
    public var titleFontWeight: AAChartFontWeightType?     //标题字体粗细
    public var subtitle: String?                           //副标题内容
    public var subtitleAlign: AAChartAlignType?            //副标题文本水平对齐方式
    public var subtitleFontColor: String?                  //副标题字体颜色
    public var subtitleFontSize: Float?                    //副标题字体大小
    public var subtitleFontWeight: AAChartFontWeightType?  //副标题字体粗细
    public var axesTextColor: String?                      //x 轴和 y 轴文字颜色
    public var chartType: AAChartType?                     //图表类型
    public var stacking: AAChartStackingType?              //堆积样式
    public var markerSymbol: AAChartSymbolType?            //折线曲线连接点的类型："circle", "square", "diamond", "triangle","triangle-down"，默认是"circle"
    public var markerSymbolStyle: AAChartSymbolStyleType?  //折线或者曲线的连接点是否为空心的
    public var zoomType: AAChartZoomType?                  //缩放类型 AAChartZoomTypeX表示可沿着 x 轴进行手势缩放
    public var inverted: Bool?                             //x 轴是否翻转(垂直)
    public var xAxisReversed: Bool?                        //x 轴翻转
    public var yAxisReversed: Bool?                        //y 轴翻转
    public var polar: Bool?                                //是否极化图形(变为雷达图)
    public var margin: [Float]?                            //图表外边缘和绘图区域之间的边距. 数组中的数字分别表示顶部，右侧，底部和左侧
    public var dataLabelsEnabled: Bool?                    //数据标签是否显示
    public var dataLabelsFontColor: String?                //数据标签的字体颜色
    public var dataLabelsFontSize: Float?                  //数据标签的字体大小
    public var dataLabelsFontWeight: AAChartFontWeightType?//数据标签的字体粗细
    public var xAxisLabelsEnabled: Bool?                   //x 轴是否显示数据
    public var categories: [String]?                       //x 轴是否显示数据
    public var xAxisGridLineWidth: Float?                  //x 轴网格线的宽度
    public var xAxisVisible: Bool?                         //x 轴是否显示
    public var xAxisTickInterval: Int?                     //x 轴刻度线间隔
    public var yAxisVisible: Bool?                         //y 轴是否显示
    public var yAxisLabelsEnabled: Bool?                   //y 轴是否显示数据
    public var yAxisTitle: String?                         //y 轴标题
    public var yAxisLineWidth: Float?                      //y 轴轴线的宽度
    public var yAxisMin: Float?                            //y 轴起始位置的最小值
    public var yAxisMax: Float?                            //y 轴结束位置的最大值
    public var yAxisAllowDecimals: Bool?                   //y 轴是否允许小数
    public var yAxisGridLineWidth: Float?                  //y 轴网格线的宽度
    public var tooltipEnabled: Bool?                       //是否显示浮动提示框(默认显示)
    public var tooltipValueSuffix: String?                 //浮动提示框单位后缀
    public var tooltipCrosshairs: Bool?                    //是否显示准星线(默认显示)
    public var colorsTheme: [Any]?                         //图表主题颜色数组
    public var series: [Any]?                              //图表的数据数组
    public var legendEnabled: Bool?                        //是否显示图例
    public var backgroundColor: Any?                       //图表背景色
    public var borderRadius: Int?                          //柱状图长条图头部圆角半径(可用于设置头部的形状,仅对条形图,柱状图有效)
    public var markerRadius: Int?                          //折线连接点的半径长度
    public var scrollablePlotArea: AAScrollablePlotArea?   //设置图表纵向或横向的滚动效果

    ...
    ...  
}
```

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

## 源代码⛓
语言版本 |  项目名称 | 适用平台| 源代码链接|
------------ | ------------- | ------------- | ------------- |
Swift | AAInfographics |  iOS |https://github.com/AAChartModel/AAChartKit-Swift |
Objective C | AAChartKit | iOS | https://github.com/AAChartModel/AAChartKit |
Kotlin | AAInfographics | Android | https://github.com/AAChartModel/AAChartCore-Kotlin |
Java | AAChartCore | Android | https://github.com/AAChartModel/AAChartCore |

## 许可证

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png)

本项目 `AAInfographics`使用 MIT许可证,详情请点击[MIT LICENSE](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE)

## 联系方式

-------------------------------------------------------------------------------
*  🌕 🌖 🌗 🌘     暖心提示   🌑 🌒 🌓 🌔
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

- [x] 支持图形加载完成后用户添加代理事件
- [x] 支持图形动态刷新全局内容
- [x] 支持图形动态刷新纯数据`(series)`内容
- [x] 支持色彩图层渐变效果
- [x] 支持3D图形效果,仅对`柱状图`、`条形图`、`扇形图`、`散点图`、`气泡图`等部分图形有效
- [x] 支持横屏(全屏)效果
- [x] 支持自由设置图形渲染动画
- [x] 支持用户自由配置`AAOptions`模型对象属性
- [x] 支持图形堆叠
- [x] 支持图形坐标轴反转
- [x] 支持渲染散点图
- [x] 支持渲染柱形范围图
- [x] 支持渲染面积范围图
- [x] 支持渲染面积范围均线图
- [x] 支持渲染极地图
- [x] 支持渲染折线直方图
- [x] 支持渲染折线直方填充图
- [x] 支持渲染矩形树状层级关系图
- [x] 支持渲染活动刻度仪表图
- [x] 支持为图形添加点击事件回调
- [x] 支持为图形添加手指✋🏻或鼠标🖱滑过的事件回调
- [x] 支持图形实时刷新纯数据并动态滚动
- [ ] 支持已渲染图形生成图片文件
- [ ] 支持生成图片文件保存至系统相册


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
