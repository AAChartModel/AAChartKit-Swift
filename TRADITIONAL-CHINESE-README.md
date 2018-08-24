  ![AAInfographics-LOGO](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/AAInfographics-LOGO.png)
# AAInfographics

 
[![Support](https://img.shields.io/badge/support-iOS%206%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) </br>
[![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE)</br>
[![](https://img.shields.io/badge/language-Swift-green.svg)](https://github.com/AAChartModel/AAChartKit-Swift) </br>
[![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md#當前已支持的圖表渲染動畫類型有三十種以上說明如下)</br>
[![](https://img.shields.io/badge/support-OC-orange.svg)](https://github.com/AAChartModel/AAChartKit)</br>
[![](https://jaywcjlove.github.io/sb/lang/chinese.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md)</br>
[![](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/AAChartModel/AAChartKit-Swift)</br>
[![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/AAChartModel/AAChartKit-Swift.svg)](http://isitmaintained.com/project/AAChartModel/AAChartKit-Swift "Average time to resolve an issue")</br>
[![Percentage of issues still open](http://isitmaintained.com/badge/open/AAChartModel/AAChartKit-Swift.svg)](http://isitmaintained.com/project/AAChartModel/AAChartKit-Swift "Percentage of issues still open")


## [ **English Document 🇬🇧** ](https://github.com/AAChartModel-Swift/AAChartKit)  |  [ **简体中文文档 🇨🇳** ](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md)| [ **繁體中文文檔 🇭🇰** ](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/TRADITIONAL-CHINESE-README.md)

### 您所喜愛的`AAInfographics`開源圖表框架同時更有`Objective-C`版本可供使用,詳情請點擊以下鏈接
### 傳送門
#### *https://github.com/AAChartModel/AAChartKit*

## 前言

 ***AAInfographics***,是 [AAChartKit](https://github.com/AAChartModel/AAChartKit) 的 `swift`語言版本,是在流行的開源前端圖表框架*Highcharts*的基礎上,封裝的面向對象的,壹組簡單易用,極其精美的圖表繪制控件.可能是這個星球上 UI 最精致的第三方 iOS 開源圖表框架了(✟我以無神論者的名義向上帝起誓🖐,我真的沒有在說鬼話✟)

***
## 功能特性

1. **環境友好,兼容性強**. 適配 `iOS 6 +`,  支持`ARC`,支持 `swift`語言,配置簡單.同時更有 Objective-C 版本[AAChartKit](https://github.com/AAChartModel/AAChartKit)可供使用.
1. **功能強大,類型多樣**. 支持`柱狀圖` 、`條形圖` 、`折線圖` 、`曲線圖` 、`折線填充圖` 、`曲線填充圖`、`雷達圖`、`極地圖`、`扇形圖`、`氣泡圖`、`散點圖`、`區域範圍圖`、`柱形範圍圖`、`面積範圍圖`、`面積範圍均線圖`、`直方折線圖`、`直方折線填充圖`、`箱線圖`、`瀑布圖`、`熱力圖`、`桑基圖`、`金字塔圖`、`漏鬥圖`、等二十幾種類型的圖形,不可謂之不多.
1. **交互式圖形動畫**. 有著清晰和充滿細節的用戶交互方式,與此同時,圖形渲染`動畫`效果細膩精致,流暢優美.有三十多種以上渲染動畫效果可供選擇,用戶可自由設置渲染圖形時的動畫時間和動畫類型,關於圖形渲染動畫類型,具體參見[ AAInfographics 動畫類型](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md#當前已支持的圖表渲染動畫類型有三十種以上說明如下).
1. **支持手勢縮放**.支持圖表的手勢縮放和拖動閱覽,手勢縮放類型具體參見[ AAInfographics 手勢縮放類型](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md#當前已支持的圖表手勢縮放類型共有三種說明如下),默認禁用手勢縮放功能.
1. **極簡主義**. `AAChartView + AAChartModel = Chart`,在 ***AAInfographics*** 數據可視化圖形框架當中,遵循這樣壹個極簡主義公式:`圖表視圖控件 + 圖表模型 = 妳想要的圖表`.同另壹款強大、精美而又易用的開源圖形框架 [AAChartKit](https://github.com/AAChartModel/AAChartKit)完全壹致.
1. **鏈式編程語法**. 支持類 *Masonry* `鏈式編程語法`,壹行代碼即可配置完成 `AAChartModel`模型對象實例.
1. **簡潔清晰,輕便易用**. 最少僅僅需要 **五行代碼** 即可完成整個圖表的繪制工作(使用鏈式編程語法配置 `AAChartModel` 實例對象時,無論妳寫多少行代碼,理論上只能算作是壹行). 😜😜😜

***

## 真機美圖
| Column Chart 柱狀圖 | Column Range Chart 條形範圍圖 | Area Chart 區域填充圖 |
| :----:  | :----: | :----: |
| ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/ColumnChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/BarChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/AreaChart.png) |

| Line Chart 折線圖 | Step Area Chart 直方折線填充圖 | Step Line Chart 直方折線圖 |
| :----:  | :----: | :----: |
| ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/LineChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/StepAreaChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/StepLineChart.png) |

| Spline Chart 曲線圖| Areaspline Chart 曲線填充圖 | Stacked Polar Chart 堆積填充圖 |
| :----:  | :----: | :----: |
| ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/SplineChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/AreasplineChart.png) | ![image1](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAChartKit/BeautyAppreciation/StackedPolarChart.png) |

| Bubble Chart 折線圖 | Arearange Average Value Chart 範圍均線圖 | Column Mixed Line Chart 雙Y軸柱形折線混合圖 |
| :----:  | :----: | :----: |
| ![image1](https://github.com/AAChartModel/Gallery/blob/master/AAInfographics/BubbleChart.png) | ![image1](https://github.com/AAChartModel/Gallery/blob/master/AAInfographics/ArearangeAverageValueChart.png) | ![image1](https://github.com/AAChartModel/Gallery/blob/master/AAInfographics/ColumnMixedLineChart.png) |

## 安裝

### 使用 CocoaPods (推薦)

1. 添加 `pod 'AAInfographics'` 到妳的 **Podfile**文件當中.
2. 在終端中運行命令 `pod install` or `pod update`.
3. 導入頭文件  `AAInfographics`.

### 手動安裝

1. 下載 Demo  `AAInfographicsDemo`
2. 將 Demo 中的名為`AAInfographics` 的文件夾拖入至妳的項目之中.


## 使用方法

1. 創建視圖*AAChartView*
```swift
        CGFloat chartViewWidth  = self.view.frame.size.width;
        CGFloat chartViewHeight = self.view.frame.size.height;
        aaChartView = AAChartView()
        aaChartView?.frame = CGRect(x:0,y:0,width:chartViewWidth,height:chartViewHeight)
        // 設置 aaChartView 的內容高度(content height)
        // aaChartView?.contentHeight = self.view.frame.size.height
        self.view.addSubview(aaChartView!)
 ```
2. 配置視圖模型*AAChartModel*

* 鏈式編程的方式配置 *AAChartModel* 模型對象屬性
```swift
    let chartModel = AAChartModel.init()
            .chartType(AAChartType.Column)//圖表類型
            .title("城市天氣變化")//圖表主標題
            .subtitle("2020年09月18日")//圖表副標題
            .inverted(false)//是否翻轉圖形
            .yAxisTitle("攝氏度")// Y 軸標題
            .legendEnabled(true)//是否啟用圖表的圖例(圖表底部的可點擊的小圓點)
            .tooltipValueSuffix("攝氏度")//浮動提示框單位後綴
            .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                         "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])//主題顏色數組
            .series([
                AASeriesElement()
                    .name("東京")
                    .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                    .toDic()!,
                AASeriesElement()
                    .name("紐約")
                    .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5])
                    .toDic()!,
                AASeriesElement()
                    .name("柏林")
                    .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0])
                    .toDic()!,
                AASeriesElement()
                    .name("倫敦")
                    .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8])
                    .toDic()!,])
```

3.  繪制圖形(創建 AAChartView 實例對象後,首次繪制圖形調用此方法)

```swift
    /*圖表視圖對象調用圖表模型對象,繪制最終圖形*/
    aaChartView?.aa_drawChartWithChartModel(aaChartModel)
```

🌹🌹🌹 好了,至此,有關於繪制圖形的任務,壹切皆已經搞定!!! 妳將得到妳想要的任意圖形!!!

### 更新圖形內容
如果妳需要更新圖表內容,妳應該閱讀以下內容,根據妳的實際需要,選擇調用適合妳的函數

* 僅僅刷新圖形的`series`數據內容(首次繪制圖形完成之後,後續刷新圖表數據均建議調用此方法)

```swift
    /*僅僅更新了圖表的series數組數據,不改動圖表的其他內容*/
    aaChartView?.aa_onlyRefreshTheChartDataWithChartModelSeries(chartModelSeriesArray)
```

*   刷新圖形除數據屬性 `series` 以外的其他屬性(首次繪制圖形完成之後,後續刷新圖表的屬性均建議調用此方法 註意:僅僅刷新圖形數據,則建議使用上面的👆`aa_onlyRefreshTheChartDataWithChartModelSeries`方法)

```swift
    /*更新 AAChartModel 整體內容(如修改了圖表的類型,將 column chart 改為 area chart)之後,刷新圖表*/
    aaChartView?.aa_refreshChartWholeContentWithChartModel(aaChartModel)
```


##  **AAChartModel**壹些重要屬性經過配置之後的圖形示例如下

- ### line chart - 折線圖

![line chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/LineChart.png)

- ### column chart - 柱形圖

![IMG_1873.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/ColumnChart.png)

- ### bar chart - 條形圖

![bar chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/BarChart.png)

- ### special area chart one - 常規折線區域填充圖

![IMG_1869.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/IMG_1482.JPG)

- ### special area chart two - 帶有負數的區域填充圖

![IMG_1871.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/AreaChartOne.png))

- ### special area chart three - 堆積效果的區域填充圖

![IMG_1863.JPG](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/AreaChartTwo.png)

- ### polar chart - 極地圖

![polar chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/PolarChart.png)

- ### radar chart - 雷達圖

![radar chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/RadarChart.png)

- ### pie chart - 扇形圖

![pie chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/PieChart.png)

- ### bubble chart - 氣泡圖

![bubble chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/BubbleChart.png)

- ### scatter chart - 散點圖

![scatter chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/ScatterChart.png)

- ### arearange chart - 區域範圍圖

![arearange chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/ArearangeChart.png)

- ### step area chart - 直方折線填充圖

![step area chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/StepAreaChart.png)

- ### mixed chart - 混合圖形

![mixed chart](https://github.com/AAChartModel/loadHtmlCssJsDemo-master/blob/master/AAInfographics/MixedChart.png)


### 更多圖形效果
註意:如下的這幅`DEMO演示圖`為大小*6M*左右的`GIF動態圖`,如未顯示動態效果則說明圖片資源未全部加載。請耐心等待至圖片資源內容完全加載結束後，即可最終觀賞更多的項目的動態演示效果.

![AAChartKit-Live](https://github.com/AAChartModel/Gallery/blob/master/AAChartKit/AAChartKit-Live.gif)


## 特別說明

### 特殊類型圖表配置

**AAInfographics** 中扇形圖、氣泡圖都歸屬為特殊類型,所以想要繪制扇形圖、氣泡圖,圖表模型 *AAChartModel* 的數據屬性`series`設置稍有不同,示例如下

- 繪制扇形圖,妳需要這樣配置模型對象 *AAChartModel*
```swift
                 aaChartModel = AAChartModel()
                .chartType(AAChartType.Pie)
                .backgroundColor("#ffffff")
                .title("LANGUAGE MARKET SHARES JANUARY,2020 TO MAY")
                .subtitle("virtual data")
                .dataLabelEnabled(true)//是否直接顯示扇形圖數據
                .yAxisTitle("℃")
                .series(
                    [
                        AASeriesElement()
                            .name("Language market shares")
                            .innerSize("20%")//內部圓環半徑大小占比(內部圓環半徑/扇形圖半徑),
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
- 繪制氣泡圖,妳需要這樣配置模型對象 *AAChartModel*

```swift  
            aaChartModel = AAChartModel()
                .chartType(AAChartType.Bubble)
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

- 繪制柱形範圍圖,妳需要這樣配置模型對象 *AAChartModel*

```swift
            aaChartModel = AAChartModel()
                .chartType(AAChartType.Columnrange)
                .title("TEMPERATURE VARIATION BY MONTH")
                .subtitle("observed in Gotham city")
                .yAxisTitle("℃")
                .categories(["January", "February", "March", "April", "May", "June",
                             "July", "August", "September", "October", "November", "December"])
                .dataLabelEnabled(true)
                .inverted(true)//x 軸是否垂直翻轉
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
            )
```
***NOTE:*** 關於更多類型特殊圖表的 `AAChartModel`實例對象屬性配置,詳情請見 ***AAInfographics*** 工程 `Demo` 中的`SpecialChartVC.swift`文件內容,查看文件內容詳情請點擊[這裏](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/AAInfographicsDemo/Demo/SpecialChartVC.swift),您也可以選擇下載 `Demo` 後,在  `Xcode` 中查看 ***AAInfographics*** 的`SpecialChartVC.swift`內容

### 當前已支持的圖表類型有十種以上,說明如下

```swift
enum AAChartType:String {
    case Column          = "column"          //柱形圖
    case Bar             = "bar"             //條形圖
    case Area            = "area"            //折線區域填充圖
    case AreaSpline      = "areaspline"      //曲線區域填充圖
    case Line            = "line"            //折線圖
    case Spline          = "spline"          //曲線圖
    case Scatter         = "scatter"         //散點圖
    case Pie             = "pie"             //扇形圖
    case Bubble          = "bubble"          //氣泡圖
    case Pyramid         = "pyramid"         //金字塔圖
    case Funnel          = "funnel"          //漏鬥圖
    case ColumnRange     = "columnrange"     //柱形範圍圖
    case AreaRange       = "arearange"       //折線區域範圍圖
    case AreaSplineRange = "areasplinerange" //曲線區域範圍圖
    case Boxplot         = "boxplot"         //箱線圖
    case Waterfall       = "waterfall"       //瀑布圖
    case Polygon         = "polygon"         //多邊形圖
}
```


### 當前已支持的圖表手勢縮放類型共有三種,說明如下

```swift
enum AAChartZoomType:String {
    case None = "none"   //禁用圖表手勢縮放功能(默認禁用手勢縮放)
    case X    = "x"      //支持圖表 X 軸橫向縮放
    case Y    = "y"      //支持圖表 Y 軸縱向縮放
    case XY   = "xy"     //支持圖表等比例縮放
}
```

NOTE:例如,設置了`AAChartModel`的縮放屬性`zoomType`為`AAChartZoomType.X`,並且將圖表進行了手勢放大之後,這時候如果想要左右滑動圖表,可以使用 **雙指點按** 屏幕中的`AAChartView`視圖區域進行 **左右拖動** 即可.同時屏幕的右上角會自動出現壹個標題為 **"恢復縮放"** 的按鈕,點擊恢復縮放,圖表大小和位置將會回歸到原初的樣式.

### 當前已支持的圖表渲染動畫類型有三十種以上,說明如下

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

以下是**AAInfographics**其中十種圖表渲染動畫類型

| Back      | Bounce    | Circ      | Cubic     | Elastic   |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![][1]    | ![][2]    | ![][3]    | ![][4]    | ![][5]    |


| Expo      | Quad      | Quart     | Quint     | Sine      |
|:---------:|:---------:|:---------:|:---------:|:---------:|
| ![][6]    | ![][7]    | ![][8]    | ![][9]    | ![][10]   |


## 關於`AAChartModel` 屬性說明

* ### AAChartModel 主要屬性說明

屬性名稱 | 屬性類型 | 描述 | 取值範圍 | 
------------ | ------------- | ------------- | ------------- |
title | String | 圖表主標題 | 任意有效的字符串 | 
subtitle | String |圖表副標題  | 任意有效的字符串 |
chartType | AAChartType |  圖表類型,可以為`AAChartType`枚舉字符串當中指定的任意有效類型.其中有支持`柱狀圖` 、`條形圖` 、`折線圖` 、`曲線圖` 、`折線填充圖` 、`曲線填充圖`、`雷達圖`、`扇形圖`、`氣泡圖`、`散點圖`、`金字塔圖`、`漏鬥圖`、`區域範圍圖`、`柱形範圍圖`等多種圖形  | AAChartType.Column,    AAChartType.Bar, AAChartType.Area, AAChartType.AreaSpline, AAChartType.Line,    AAChartType.Spline, AAChartType.Pie,    AAChartType.Bubble, AAChartType.Scatter, AAChartType.Pyramid, AAChartType.Funnel, AAChartType.Arearange, AAChartType.Columnrange|  AAChartType.Column |
stacking| AAChartStackingType | 是否將圖表每個數據列的值疊加在壹起。 默認的值為`AAChartStackingType.False`， 即禁用堆疊樣式效果.另有常規堆疊樣式和百分比堆疊樣式可供選擇 | AAChartStackingType.False, AAChartStackingType.Normal, AAChartStackingType.Percent | AAChartStackingType.False |
symbol | AAChartSymbolType | 預定義的圖表曲線連接點的樣式類型.其可供選擇的值有`圓`、`正方形`、`鉆石`、`常規三角形`和`倒三角形`,默認為混合樣式 | AAChartSymbolType.Circle, AAChartSymbolType.Square, AAChartSymbolType.Diamond, AAChartSymbolType.Triangle, AAChartSymbolType.Triangle_down | 

* ### AAChartModel 所有屬性列表說明
```swift
private var animationType:String?       //動畫類型
private var title:String?               //標題內容
private var subtitle:String?            //副標題內容
private var chartType:String?           //圖表類型
private var stacking:String?            //堆積樣式
private var symbol:String?              //折線曲線連接點的類型："circle", "square", "diamond", "triangle","triangle-down"，默認是"circle"
private var zoomType:String?            //縮放類型 AAChartZoomTypeX表示可沿著 x 軸進行手勢縮放
private var inverted:Bool?              //x 軸是否垂直
private var xAxisReversed:Bool?         //x 軸翻轉
private var yAxisReversed:Bool?         //y 軸翻轉
private var crosshairs:Bool?            //是否顯示準星線(默認顯示)
private var gradientColorEnable:Bool?   //是否要為漸變色
private var polar:Bool?                 //是否極化圖形(變為雷達圖)
private var dataLabelEnabled:Bool?      //是否顯示數據
private var xAxisLabelsEnabled:Bool?    //x軸是否顯示數據
private var categories:Array<Any>?      //x軸是否顯示數據
private var xAxisGridLineWidth:Int?     //x軸網格線的寬度
private var yAxisLabelsEnabled:Bool?    //y軸是否顯示數據
private var yAxisTitle:String?          //y軸標題
private var yAxisGridLineWidth:Int?     //y軸網格線的寬度
private var colorsTheme:Array<Any>?     //圖表主題顏色數組
private var series:Array<Any>?          //圖表的主題數據列數組
private var legendEnabled:Bool?         //是否顯示圖例
private var legendLayout:String?        //圖例數據項的布局。布局類型： "horizontal" 或 "vertical" 即水平布局和垂直布局 默認是：horizontal.
private var legendAlign:String?         //設定圖例在圖表區中的水平對齊方式，合法值有 left，center 和 right。
private var legendVerticalAlign:String? //設定圖例在圖表區中的垂直對齊方式，合法值有 top，middle 和 bottom。垂直位置可以通過 y 選項做進壹步設定
private var backgroundColor:String?     //圖表背景色
private var options3dEnable:Bool?       //是否3D化圖形(僅對條形圖,柱狀圖有效)
private var options3dAlpha:Int?
private var  options3dBeta:Int?
private var options3dDepth:Int?         //3D圖形深度
private var borderRadius:Int?           //柱狀圖長條圖頭部圓角半徑(可用於設置頭部的形狀,僅對條形圖,柱狀圖有效)
private var markerRadius:Int?           //折線連接點的半徑長度
```

## 附言

在 `AAInfographics` 數據可視化圖形框架的初始設計中,為提升`.js`文件的加載速度,故將所依賴的`.js`文件放置在本地.然而由於本項目功能較多,故放置於本地的附加`JavaScript`文件庫體積較大,整個`AAJSFiles`文件夾下所有的`.js`文件體積合計共有`250KB左右`(當然在工程打包壓縮之後實際大小遠小於此),若對工程文件體積大小較為敏感的使用者,可使用以下建議的替代方案
1.  刪除在本`AAInfographics`項目文件中,`AAJSFiles`文件夾下的`4`項`.js`文件.需要被刪除的文件名稱如下
* AAHighchartsLibrary.js
* AAHighchartsMore.js
* AAFunnel.js
2.  將`AAChartView.html`文件中的以下內容
``` html
<script src="AAHighchartsLib.js">
</script>
<script src="AAHighchartsMore.js">
</script>
<script src="AAFunnel.js">
</script>
```
替換為
``` html
<script src="https://img.hcharts.cn/highcharts/highcharts.js">
</script>
<script src="https://img.hcharts.cn/highcharts/highcharts-more.js">
</script>
```
即可.

此方案是將原本加載放置在本地的`.js`依賴文件改為了加載放置在網絡上的`.js`文件,減小了本地文件大小,但有可能會有壹定的網絡延遲(`0.5s以內`),所以建議`AAInfographics`用戶可根據自己的實際項目的開發需要,酌情選擇最終是否使用本替代方案.

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

## 源代碼⛓
語言版本 |  項目名稱 | 源代碼鏈接|
------------ | ------------- | ------------- |
Swift | AAInfographics | https://github.com/AAChartModel/AAChartKit-Swift |
Objective C | AAChartKit | https://github.com/AAChartModel/AAChartKit |

## 許可證

![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png)

本項目 `AAInfographics`使用 MIT許可證,詳情請點擊[MIT LICENSE](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE)

## 聯系方式

-------------------------------------------------------------------------------
*  🌕 🌖 🌗 🌘     暖心提示   🌑 🌒 🌓 🌔
*
* 如果有任何使用上的問題,隨時歡迎您在 GitHub 上向我提 issue.
* GitHub Issues : https://github.com/AAChartModel/AAChartKit-Swift/issues
-------------------------------------------------------------------------------
*  如果您想參與到此項目的開源活動中來,也同樣隨時歡迎您聯系我
* GitHub        : https://github.com/AAChartModel
* StackOverflow : https://stackoverflow.com/users/7842508/codeforu
* JianShu       : http://www.jianshu.com/u/f1e6753d4254
* SegmentFault  : https://segmentfault.com/u/huanghunbieguan
-------------------------------------------------------------------------------

## 待辦清單

- [x] 支持圖形加載完成後用戶添加代理事件
- [x] 支持圖形動態刷新全局內容
- [x] 支持圖形動態刷新純數據`(series)`內容
- [ ] 支持圖形實時刷新純數據並動態滾動
- [x] 支持色彩圖層漸變效果
- [x] 支持3D圖形效果,僅對`柱狀圖`、`條形圖`、`扇形圖`、`散點圖`、`氣泡圖`等部分圖形有效
- [ ] 支持橫屏(全屏)效果
- [x] 支持自由設置圖形渲染動畫
- [ ] 支持已渲染圖形生成圖片文件
- [ ] 支持生成圖片文件保存至系統相冊
- [x] 支持用戶自由配置`AAOptions`模型對象屬性
- [x] 支持圖形堆疊
- [x] 支持圖形坐標軸反轉
- [x] 支持渲染散點圖
- [x] 支持渲染柱形範圍圖
- [x] 支持渲染面積範圍圖
- [ ] 支持渲染面積範圍均線圖
- [x] 支持渲染極地圖
- [x] 支持渲染折線直方圖
- [x] 支持渲染折線直方填充圖
- [ ] 支持渲染矩形樹狀層級關系圖
- [ ] 支持渲染活動刻度儀表圖
- [ ] 支持為圖形添加點擊事件回調


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
