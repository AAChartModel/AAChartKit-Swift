Pod::Spec.new do |s|
    s.name         = 'AAInfographics'
    s.version      = '5.0.1'
    s.summary      = '📈📊📱📺💻An elegant and friendly data visualization chart framework for iOS, iPadOS and macOS. Extremely powerful ,supports line, spline, area, areaspline, column, bar, pie, scatter, angular gauges, arearange, areasplinerange, columnrange, bubble, box plot, error bars, funnel, waterfall and polar chart types.极其精美而又强大的跨平台数据可视化图表框架,支持柱状图、条形图、折线图、曲线图、折线填充图、曲线填充图、气泡图、扇形图、环形图、散点图、雷达图、混合图等各种类型的多达几十种的信息图图表,完全满足工作所需.'
    s.description  = <<-DESC
## Features

* 🎂  **Environment friendly**. Support `iOS `、`iPadOS` and  `macOS`. Totally support `Swift` language, and there are more types version such as  `Objective-C` language version [AAChartKit](https://github.com/AAChartModel/AAChartKit) 、 `Java` language version [AAChartCore](https://github.com/AAChartModel/AAChartCore) 、`Kotlin` language version [AAInfographics](https://github.com/AAChartModel/AAChartCore-Kotlin) . To get more details you can see the [source code links list](https://github.com/AAChartModel/AAChartKit-Swift#source-code).

* 🚀  **Powerful and easy to use**. It supports `column chart`, `bar chart`, `area chart`, `areaspline chart`, `line chart`, `spline chart`, `radar chart`, `polar chart`, `pie chart`, `bubble chart`, `pyramid chart`, `funnel chart`, `columnrange chart`, `arearange chart`, `mixed chart` and other graphics. Support for more chart types is planned.

* 📝  **Modern Declarative Syntax**. Unlike previous imperative programming techniques, drawing any custom chart in AAChartKit, you don't need to care about the inner implementation details which is annoying && boring. *Describe what you want, you will get what you described*.

* 🎮  **Interactive and animated**. The charts `animation` effect is exquisite, delicate, smooth and beautiful.

* ⛓  **Chain programming**.  Supports `chain programming syntax` like *Masonry* .

* 🦋  **Minimalist**. `AAChartView + AAChartModel = Chart`. The AAChartKit follows a minimalist formula: Chart view + Chart model = The chart you want, just like the powerful and beautiful charts framework [AAChartKit](https://github.com/AAChartModel/AAChartKit).

* 🖱 **Interaction event callback**. Support for monitoring [user click events and single finger move over events](https://github.com/AAChartModel/AAChartKit-Swift#support-user-click-events-and-move-over-events), which can be used to achieve double charts linked-working and even multiple charts linkage, as well as other more complex custom user interaction effects.
                   DESC

    s.homepage      = 'https://github.com/AAChartModel/AAChartKit-Swift'
    s.license       = 'MIT'
    s.authors       = {'An An' => '2236368544@qq.com'}
    s.platform      = :ios, '9.0'
    s.source        = {:git => 'https://github.com/AAChartModel/AAChartKit-Swift.git', :tag => s.version}
    s.source_files  = 'AAInfographics', 'AAInfographics/**/*.{swift}'
    s.resources     = "AAInfographics/AAJSFiles.bundle"
    s.requires_arc  = true
    s.swift_version = '5.0'
end
