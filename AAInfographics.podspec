Pod::Spec.new do |s|
    s.name         = 'AAInfographics'
    s.version      = '2.0.2'
    s.summary      = '📈📊An elegant and friendly chart library for iOS developer who use Swift. Powerful,support the column chart、bar chart、area chart、areaspline chart、line chart、spline chart、radar chart、polar chart、pie chart、bubble chart、pyramid chart、funnel chart、columnrange chart and other graphics.极其精美而又强大的 iOS 图表组件库,支持柱状图、条形图、折线图、曲线图、折线填充图、曲线填充图、气泡图、扇形图、环形图、散点图、雷达图、混合图等各种类型的多达几十种的信息图图表,完全满足工作所需.'
    s.description  = <<-DESC
An elegant and friendly chart library for iOS developer who use Swift

1. Support `iOS 8`、`ARC` & `Swift`.
2. Powerful,support the  `column chart` `bar chart` `line chart` `spline chart` `pie chart` `polar chart` `radar chart` and other graphics.
3. Interactive、animated,the `animation` is exquisite and deligate.
4. Support `chain programming syntax` like *Masonry* 
5. `AAChartView + AAChartModel = Chart`  In the AAInfographics,it follows a minimalist formula: ` Chart view + Chart model = The chart you want`.
                   DESC

    s.homepage     = 'https://github.com/AAChartModel/AAChartKit-Swift'
    s.license      = 'MIT'
    s.authors      = {'An An' => '18256973864@163.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/AAChartModel/AAChartKit-Swift.git', :tag => s.version}
    s.source_files = 'AAInfographics', 'AAInfographics/**/*.{swift}'
    s.resource     = 'AAInfographics/AAJSFiles.bundle'
    s.requires_arc = true
end
