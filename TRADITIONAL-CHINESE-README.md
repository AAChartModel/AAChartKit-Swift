 ![AAInfographics-LOGO]( https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/AAInfographics-Logo.png)
 
 # AAInfographics

   
  [![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/) </br>
  [![](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/LICENSE)</br>
  [![](https://img.shields.io/badge/language-Swift-green.svg)](https://github.com/AAChartModel/AAChartKit-Swift) </br>
  [![](https://img.shields.io/badge/support-Animation-yellow.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md#當前已支持的圖表渲染動畫類型有三十種以上說明如下)</br>
  [![](https://img.shields.io/badge/support-OC-orange.svg)](https://github.com/AAChartModel/AAChartKit)</br>
  [![](https://jaywcjlove.github.io/sb/lang/chinese.svg)](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md)</br>
  [![](https://jaywcjlove.github.io/sb/lang/english.svg)](https://github.com/AAChartModel/AAChartKit-Swift)</br>
  [![Average time to resolve an issue](http://isitmaintained.com/badge/resolution/AAChartModel/AAChartKit-Swift.svg)](http://isitmaintained.com/project/AAChartModel/AAChartKit-Swift "Average time to resolve an issue")</br>
  [![Percentage of issues still open](http://isitmaintained.com/badge/open/AAChartModel/AAChartKit-Swift.svg)](http://isitmaintained.com/project/AAChartModel/AAChartKit-Swift "Percentage of issues still open")


  ## [ **English Document 🇬🇧** ](https://github.com/AAChartModel/AAChartKit-Swift)  |  [ **簡體中文文檔 🇨🇳** ](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/CHINESE-README.md)| [ **繁體中文文檔 🇭🇰** ](https://github.com/AAChartModel/AAChartKit-Swift/blob/master/TRADITIONAL-CHINESE-README.md)

  ### 您所喜愛的`AAInfographics`開源圖表框架同時更有`Objective-C`版本可供使用,詳情請點擊以下鏈接
  ### 傳送門
  #### *https://github.com/AAChartModel/AAChartKit*

  ## 前言

   ***AAInfographics***,是 [AAChartKit](https://github.com/AAChartModel/AAChartKit) 的 `swift`語言版本,是在流行的開源前端圖表框架*Highcharts*的基礎上,封裝的面向對象的,壹組簡單易用,極其精美的圖表繪制控件.可能是這個星球上 UI 最精致的第三方 iOS 開源圖表框架了(✟我以無神論者的名義向上帝起誓🖐,我真的沒有在說鬼話✟)

  ***
  ## 功能特性

  * 🎂        **環境友好,兼容性強**. 適配 `iOS 9 +`, 支持`iOS`、`iPad OS`、及 `macOS`,  支持 `Swift`語言, 同時更有 `Objective-C` 語言版本 [AAChartKit](https://github.com/AAChartModel/AAChartKit) 、 `Java` 語言版本 [AAChartCore](https://github.com/AAChartModel/AAChartCore) 、`Kotlin` 語言版本 [AAChartCore-Kotlin](https://github.com/AAChartModel/AAChartCore-Kotlin) 可供使用, 配置導入工程簡單易操作. 支持的所有語言版本及連接,參見此[列表](#源代碼).

  * 🚀        **功能強大,類型多樣**. 支持`柱狀圖` 、`條形圖` 、`折線圖` 、`曲線圖` 、`折線填充圖` 、`曲線填充圖`、`直方折線圖`、`直方折線填充圖`、`雷達圖`、`極地圖`、`餅圖`、`環形圖`、`扇形圖`、`氣泡圖`、`散點圖`、`區域範圍圖`、`柱形範圍圖`、`面積範圍圖`、`面積範圍均線圖`、`箱線圖`、`瀑布圖`、`金字塔圖`、`漏鬥圖`、`多邊形圖`、`儀表圖`、`誤差圖`、`常規堆積圖`、`百分比堆積圖`、`混合圖`、等二十幾種類型的圖形,不可謂之不多.

  * 📝        **現代化聲明式語法**. 與過往的命令式編程技巧不同, 在 AAChartKit 中繪制任意壹款自定義圖表, 妳完全無需關心撓人的內在實現細節. 描述妳所要得到的, 妳便得到妳所描述的.

  * 🔬        **細致入微的用戶自定義功能**. 基礎的`主標題`、`副標題`、`X 軸`、`Y 軸`自不必談, 從縱橫的`交互準星線`、跟手的`浮動提示框`, 到切割數值的`值域分割顏色線`、`值域分割顏色帶`, 再到細小的`線條`類型,`標記點`樣式,  各種細微的圖形子組件, 應有盡有. 以至於不論是`極簡`、抽象的小清新風格, 還是紛繁`復雜`的嚴肅商業派頭, 均可完美駕馭.

  * 🎮        **交互式圖形動畫**. 有著清晰和充滿細節的用戶交互方式,與此同時,圖形渲染`動畫`效果細膩精致,流暢優美.有三十多種以上渲染動畫效果可供選擇,用戶可自由設置渲染圖形時的動畫時間和動畫類型,關於圖形渲染動畫類型,具體參見[ AAInfographics 動畫類型](#當前已支持的圖表渲染動畫類型有三十種以上).

  * 🦋        **極簡主義**. `AAChartView + AAChartModel = Chart`,在 ***AAInfographics*** 數據可視化圖形框架當中,遵循這樣壹個極簡主義公式:`圖表視圖控件 + 圖表模型 = 妳想要的圖表`.同另壹款強大、精美而又易用的開源圖形框架 [AAChartKit](https://github.com/AAChartModel/AAChartKit)完全壹致.

  * ⛓        **鏈式編程語法**. 支持類 *Masonry* `鏈式編程語法`,壹行代碼即可配置完成 `AAChartModel`模型對象實例.

  * 🎈        **簡潔清晰,輕便易用**. 最少僅僅需要 **五行代碼** 即可完成整個圖表的繪制工作(使用鏈式編程語法配置 `AAChartModel` 實例對象時,無論妳寫多少行代碼,理論上只能算作是壹行). 😜😜😜

  * 🖱        **支持點擊事件** 支持監聽用戶交互事件,可在此基礎上實現雙表聯動乃至多表聯動,以及其他更多更復雜的自定義用戶交互效果.具體參見[支持監聽用戶點擊事件及單指滑動事件](#支持監聽用戶點擊事件及單指滑動事件)

  * 👌        **支持手勢縮放**.支持圖表的手勢縮放和拖動閱覽,手勢縮放類型具體參見[ AAInfographics 手勢縮放類型](#當前已支持的圖表手勢縮放類型共有三種說明如下),默認禁用手勢縮放功能.

  ***





  ## 真機美圖

  <div>
  <img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/ColumnChart.png' width=285>
  <img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/BarChart.png' width=285>
  <img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/AreaChart.png' width=285>
  </div>

  <div>
  <img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/LineChart.png' width=285>
  <img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/StepAreaChart.png' width=285>
  <img src='https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAChartKit/BeautyAppreciation/StepLineChart.png' width=285>
  </div>

  <div>
  <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/splineChart.png' width=285>
  <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/areasplineChart.png' width=285>
  <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/percentStackingAreasplineChart.png' width=285>
  </div>

  <div>
  <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/BubbleChart.png' width=285>
  <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/ArearangeAverageValueChart.png' width=285>
  <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAInfographics/ColumnMixedLineChart.png' width=285>
  </div>

  <div>
  <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/scatterChart.png' width=285>
  <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/boxplotChart.png' width=285>
  <img src='https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/MirrorColumnChart.png' width=285>
  </div>


  ## 安裝

  ### 使用 CocoaPods (推薦)

  1. 添加 
  ```ruby
  pod 'AAInfographics', :git => 'https://github.com/AAChartModel/AAChartKit-Swift.git'

  ```
   到妳的 **Podfile** 文件當中.
   
  2. 在終端中運行命令 `pod install` or `pod update`.
  3. 導入頭文件  `AAInfographics`.

  ### 使用 Carthage

  1. 添加 
  ```ruby
  github "https://github.com/AAChartModel/AAChartKit-Swift.git" ~> 1.0

  ```
   到妳的 **Cartfile** 文件當中.
   
  2. 在終端中運行命令 `carthage bootstrap` or `carthage update`.
  3. 導入頭文件  `AAInfographics`.

  ### 手動安裝

  1. 下載 Demo  `AAInfographicsDemo`
  2. 將 Demo 中的名為`AAInfographics` 的文件夾拖入至妳的項目之中.


  ## 使用方法

  1. 創建視圖*AAChartView*
  ```swift
          let chartViewWidth  = self.view.frame.size.width
          let chartViewHeight = self.view.frame.size.height
          aaChartView = AAChartView()
          aaChartView?.frame = CGRect(x:0,y:0,width:chartViewWidth,height:chartViewHeight)
          // 設置 aaChartView 的內容高度(content height)
          // aaChartView?.contentHeight = self.view.frame.size.height
          self.view.addSubview(aaChartView!)
   ```
  2. 配置視圖模型*AAChartModel*

  * 鏈式編程的方式配置 *AAChartModel* 模型對象屬性
  ```swift
      let chartModel = AAChartModel()
              .chartType(.area)//圖表類型
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
                      .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
                  AASeriesElement()
                      .name("紐約")
                      .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
                  AASeriesElement()
                      .name("柏林")
                      .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
                  AASeriesElement()
                      .name("倫敦")
                      .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]),
                      ])
  ```

  3.  繪制圖形(創建 AAChartView 實例對象後,首次繪制圖形調用此方法)

  ```swift
      /*圖表視圖對象調用圖表模型對象,繪制最終圖形*/
      aaChartView?.aa_drawChartWithChartModel(aaChartModel)
  ```

  🎉🎉🎉  好了,至此,有關於繪制圖形的任務,壹切皆已經搞定!!! 妳將得到妳想要的任意圖形!!! 🌈🌈🌈

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

  ![line chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/LineChart.png)

  - ### column chart - 柱形圖

  ![IMG_1873.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ColumnChart.png)

  - ### bar chart - 條形圖

  ![bar chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/BarChart.png)

  - ### special area chart one - 常規折線區域填充圖

  ![IMG_1869.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/IMG_1482.JPG)

  - ### special area chart two - 帶有負數的區域填充圖

  ![IMG_1871.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/AreaChartOne.png))

  - ### special area chart three - 堆積效果的區域填充圖

  ![IMG_1863.JPG](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/AreaChartTwo.png)

  - ### polar chart - 極地圖

  ![polar chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/PolarChart.png)

  - ### radar chart - 雷達圖

  ![radar chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/RadarChart.png)

  - ### pie chart - 扇形圖

  ![pie chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/PieChart.png)

  - ### bubble chart - 氣泡圖

  ![bubble chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/BubbleChart.png)

  - ### scatter chart - 散點圖

  ![scatter chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ScatterChart.png)

  - ### arearange chart - 區域範圍圖

  ![arearange chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/ArearangeChart.png)

  - ### step area chart - 直方折線填充圖

  ![step area chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/StepAreaChart.png)

  - ### mixed chart - 混合圖形

  ![mixed chart](https://raw.githubusercontent.com/AAChartModel/loadHtmlCssJsDemo-master/master/AAInfographics/MixedChart.png)


  ### 更多圖形效果
  註意:如下的這幅`DEMO演示圖`為大小*6M*左右的`GIF動態圖`,如未顯示動態效果則說明圖片資源未全部加載。請耐心等待至圖片資源內容完全加載結束後，即可最終觀賞更多的項目的動態演示效果.

  ![AAChartKit-Live](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/AAChartKit-Live.gif)


  ## 特別說明

  ### 支持監聽用戶點擊事件及單指滑動事件

   可通過給 AAChartView 實例對象設置代理方法,來實現監聽用戶的點擊事件和單指滑動事件
    
   ```swift
    //設置 AAChartView 事件代理
    aaChartView!.delegate = self as AAChartViewDelegate
    //設置 AAChartModel 支持觸摸事件
    aaChartModel = aaChartModel!.touchEventEnabled(true)

    //實現對 AAChartView 事件代理的監聽
  extension CommonChartVC: AAChartViewDelegate {
      open func aaChartView(_ aaChartView: AAChartView, moveOverEventMessage: AAMoveOverEventMessageModel) {
          print("🔥selected point series element name: \(moveOverEventMessage.name ?? "")")
      }
  }
  ```
  
   在監聽用戶交互事件時,獲取的事件信息`AAMoveOverEventMessageModel`共包含以下內容
    ```swift
  public class AAMoveOverEventMessageModel: NSObject {
      public var name: String?
      public var x: Float?
      public var y: Float?
      public var category: String?
      public var offset: [String: Any]?
      public var index: Int?
  }
    ```
    
   監聽用戶點擊事件可實現多種多樣的自定義功能. 例如可通過用戶點擊事件回調來實現**雙表聯動**, 示例效果如下
    
    ![doubleChartsLinkage](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/doubleChartsLinkage.gif)


  ### 支持通過`JavaScript` 函數來自定義 `AATooltip`視圖顯示效果
  有時系統默認的 tooltip 浮動提示框的顯示效果無法滿足使用者的特殊自定義要求,此時可以通過添加 AATooltip 的 `headerFormat`、`footerFormat` 和 `pointFormat` 的字符串屬性的`HTML`文本內容,來自定義浮動提示框的顯示內容,此三者可以勝任絕大數情況下的自定義浮動提示框 AATooltip 的任務.

  如仍舊不能滿足需求,更可以通過 AATooltip 的 `formatter` 函數來實現視圖的特殊定制化 例如,如下配置 AATooltip 實例對象屬性
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
              .valueDecimals(2)//設置取值精確到小數點後幾位//設置取值精確到小數點後幾位
              .backgroundColor("#000000")
              .borderColor("#000000")
              .style(
                  AAStyle()
                      .color("#FFD700")
                      .fontSize(12)
                      )
            
  ```
  即可完成圖表的浮動提示框的特殊定制化.得到的自定義浮動提示框的視覺效果圖如下👇
  ![Custom Tooltip Style](https://user-images.githubusercontent.com/16357599/56589690-543c5880-6618-11e9-9d18-6bc0fe2fa53f.png)

  ### 支持添加值域分割功能⚔

  * 添加值域分割顏色帶 `plotBands 🎀`
  ![plotBandsChart](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/plotBandsChart.png)


  * 添加值域分割顏色線 `plotLines 🧶`
  ![plotLinesChart](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/plotLinesChart.png)


  * 添加值域分割數據列分區 `zones 🧱`
  ![plotLinesChart](https://raw.githubusercontent.com/AAChartModel/Gallery/master/AAChartKit/seriesZonesChart.png)



  ### 當前已支持的圖表類型有十種以上,說明如下

  ```swift
  enum AAChartType: String {
      case column          = "column"          //柱形圖
      case bar             = "bar"             //條形圖
      case area            = "area"            //折線區域填充圖
      case areaspline      = "areaspline"      //曲線區域填充圖
      case line            = "line"            //折線圖
      case spline          = "spline"          //曲線圖
      case scatter         = "scatter"         //散點圖
      case pie             = "pie"             //扇形圖
      case bubble          = "bubble"          //氣泡圖
      case pyramid         = "pyramid"         //金字塔圖
      case funnel          = "funnel"          //漏鬥圖
      case columnrange     = "columnrange"     //柱形範圍圖
      case arearange       = "arearange"       //折線區域範圍圖
      case areasplinerange = "areasplinerange" //曲線區域範圍圖
      case boxplot         = "boxplot"         //箱線圖
      case waterfall       = "waterfall"       //瀑布圖
      case polygon         = "polygon"         //多邊形圖
  }
  ```

  ### 當前已支持的圖表手勢縮放類型共有三種,說明如下

  ```swift
  enum AAChartZoomType: String {
      case none = "none"   //禁用圖表手勢縮放功能(默認禁用手勢縮放)
      case x    = "x"      //支持圖表 X 軸橫向縮放
      case y    = "y"      //支持圖表 Y 軸縱向縮放
      case xy   = "xy"     //支持圖表等比例縮放
  }
  ```

  NOTE:例如,設置了`AAChartModel`的縮放屬性`zoomType`為`AAChartZoomType.X`,並且將圖表進行了手勢放大之後,這時候如果想要左右滑動圖表,可以使用 **雙指點按** 屏幕中的`AAChartView`視圖區域進行 **左右拖動** 即可.同時屏幕的右上角會自動出現壹個標題為 **"恢復縮放"** 的按鈕,點擊恢復縮放,圖表大小和位置將會回歸到原初的樣式.

  ### 當前已支持的圖表渲染動畫類型有三十種以上

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
  chartType | AAChartType |  圖表類型,可以為`AAChartType`枚舉字符串當中指定的任意有效類型.其中有支持`柱狀圖` 、`條形圖` 、`折線圖` 、`曲線圖` 、`折線填充圖` 、`曲線填充圖`、`雷達圖`、`扇形圖`、`氣泡圖`、`散點圖`、`金字塔圖`、`漏鬥圖`、`區域範圍圖`、`柱形範圍圖`等多種圖形  | .column,  .bar,  .area,  .areaSpline,  .line,  .spline,  .pie,  .bubble,  .scatter,  .pyramid,  .funnel,  .areaRange,  .columnRange |  
  stacking| AAChartStackingType | 是否將圖表每個數據列的值疊加在壹起。 默認的值為`.none`， 即禁用堆疊樣式效果.另有常規堆疊樣式和百分比堆疊樣式可供選擇 | .none,  .normal,  .percent | 
  symbol | AAChartSymbolType | 預定義的圖表曲線連接點的樣式類型.其可供選擇的值有`圓`、`正方形`、`鉆石`、`常規三角形`和`倒三角形`,默認為混合樣式 | .circle,  .square,  .diamond,  .triangle,  .triangleDown | 

  * ### AAChartModel 所有屬性列表說明
  ```swift
  public var animationType: AAChartAnimationType?        //動畫類型
  public var animationDuration: Int?                     //動畫時間
  public var title: String?                              //標題內容
  public var titleFontColor: String?                     //標題字體顏色
  public var titleFontSize: Float?                       //標題字體大小
  public var titleFontWeight: AAChartFontWeightType?     //標題字體粗細
  public var subtitle: String?                           //副標題內容
  public var subtitleAlign: AAChartAlignType?            //副標題文本水平對齊方式
  public var subtitleFontColor: String?                  //副標題字體顏色
  public var subtitleFontSize: Float?                    //副標題字體大小
  public var subtitleFontWeight: AAChartFontWeightType?  //副標題字體粗細
  public var axesTextColor: String?                      //x 軸和 y 軸文字顏色
  public var chartType: AAChartType?                     //圖表類型
  public var stacking: AAChartStackingType?              //堆積樣式
  public var markerSymbol: AAChartSymbolType?            //折線曲線連接點的類型："circle", "square", "diamond", "triangle","triangle-down"，默認是"circle"
  public var markerSymbolStyle: AAChartSymbolStyleType?  //折線或者曲線的連接點是否為空心的
  public var zoomType: AAChartZoomType?                  //縮放類型 AAChartZoomTypeX表示可沿著 x 軸進行手勢縮放
  public var inverted: Bool?                             //x 軸是否翻轉(垂直)
  public var xAxisReversed: Bool?                        //x 軸翻轉
  public var yAxisReversed: Bool?                        //y 軸翻轉
  public var polar: Bool?                                //是否極化圖形(變為雷達圖)
  public var margin: [Float]?                            //圖表外邊緣和繪圖區域之間的邊. 數組中的數字分別表示頂部，右側，底部和左側
  public var dataLabelsEnabled: Bool?                    //數據標簽是否顯示
  public var dataLabelsFontColor: String?                //數據標簽的字體顏色
  public var dataLabelsFontSize: Float?                  //數據標簽的字體大小
  public var dataLabelsFontWeight: AAChartFontWeightType?//數據標簽的字體粗細
  public var xAxisLabelsEnabled: Bool?                   //x 軸是否顯示數據
  public var categories: [String]?                       //x 軸是否顯示數據
  public var xAxisGridLineWidth: Float?                  //x 軸網格線的寬度
  public var xAxisVisible: Bool?                         //x 軸是否顯示
  public var xAxisTickInterval: Int?                     //x 軸刻度線間隔
  public var yAxisVisible: Bool?                         //y 軸是否顯示
  public var yAxisLabelsEnabled: Bool?                   //y 軸是否顯示數據
  public var yAxisTitle: String?                         //y 軸標題
  public var yAxisLineWidth: Float?                      //y 軸軸線的寬度
  public var yAxisMin: Float?                            //y 軸起始位置的最小值
  public var yAxisMax: Float?                            //y 軸結束位置的最大值
  public var yAxisAllowDecimals: Bool?                   //y 軸是否允許小數
  public var yAxisGridLineWidth: Float?                  //y 軸網格線的寬度
  public var tooltipEnabled: Bool?                       //是否顯示浮動提示框(默認顯示)
  public var tooltipValueSuffix: String?                 //浮動提示框單位後綴
  public var tooltipCrosshairs: Bool?                    //是否顯示準星線(默認顯示)
  public var colorsTheme: [Any]?                         //圖表主題顏色數組
  public var series: [Any]?                              //圖表的數據數組
  public var legendEnabled: Bool?                        //是否顯示圖例
  public var backgroundColor: Any?                       //圖表背景色
  public var borderRadius: Int?                          //柱狀圖長條圖頭部圓角半徑(可用於設置頭部的形狀,僅對條形圖,柱狀圖有效)
  public var markerRadius: Int?                          //折線連接點的半徑長度
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

  ## 源代碼⛓
  語言版本 |  項目名稱 | 適用平臺| 源代碼鏈接|
  ------------ | ------------- | ------------- | ------------- |
  Swift | AAInfographics |  iOS |https://github.com/AAChartModel/AAChartKit-Swift |
  Objective C | AAChartKit | iOS | https://github.com/AAChartModel/AAChartKit |
  Kotlin | AAInfographics | Android | https://github.com/AAChartModel/AAChartCore-Kotlin |
  Java | AAChartCore | Android | https://github.com/AAChartModel/AAChartCore |

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
  - [x] 支持色彩圖層漸變效果
  - [x] 支持3D圖形效果,僅對`柱狀圖`、`條形圖`、`扇形圖`、`散點圖`、`氣泡圖`等部分圖形有效
  - [x] 支持橫屏(全屏)效果
  - [x] 支持自由設置圖形渲染動畫
  - [x] 支持用戶自由配置`AAOptions`模型對象屬性
  - [x] 支持圖形堆疊
  - [x] 支持圖形坐標軸反轉
  - [x] 支持渲染散點圖
  - [x] 支持渲染柱形範圍圖
  - [x] 支持渲染面積範圍圖
  - [x] 支持渲染面積範圍均線圖
  - [x] 支持渲染極地圖
  - [x] 支持渲染折線直方圖
  - [x] 支持渲染折線直方填充圖
  - [x] 支持渲染矩形樹狀層級關系圖
  - [x] 支持渲染活動刻度儀表圖
  - [x] 支持為圖形添加點擊事件回調
  - [x] 支持圖形實時刷新純數據並動態滾動
  - [ ] 支持已渲染圖形生成圖片文件
  - [ ] 支持生成圖片文件保存至系統相冊


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
