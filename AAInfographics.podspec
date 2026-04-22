Pod::Spec.new do |s|
    s.name         = 'AAInfographics'
    s.version      = '10.0.0'
    s.summary      = '📈📊📱📺💻An elegant modern declarative data visualization chart framework for iOS, iPadOS and macOS. Extremely powerful, supports line, spline, area, areaspline, column, bar, pie, scatter, angular gauges, arearange, areasplinerange, columnrange, bubble, box plot, error bars, funnel, waterfall and polar chart types. 极其精美而又强大的跨平台数据可视化图表框架,支持柱状图、条形图、折线图、曲线图、折线填充图、曲线填充图、气泡图、扇形图、环形图、散点图、雷达图、混合图等各种类型的多达几十种的信息图图表,完全满足工作所需.'
    s.homepage      = 'https://github.com/AAChartModel/AAChartKit-Swift'
    s.license       = 'MIT'
    s.authors       = {'An An' => '2236368544@qq.com'}
    s.ios.deployment_target = '10.0'
    s.osx.deployment_target = '10.13'
    s.source        = {:git => 'https://github.com/AAChartModel/AAChartKit-Swift.git', :tag => s.version}
    s.source_files  = 'AAInfographics/**/*.{swift}'
    s.exclude_files = 'AAInfographics/**/PackageBundlePathLoader.swift'
    s.resources     = "AAInfographics/AAJSFiles.bundle"
    s.requires_arc  = true
    s.swift_version = '5.0'
end
