Pod::Spec.new do |s|
    s.name         = 'AAInfographics'
    s.version      = '1.0.2'
    s.summary      = 'An elegant and friendly chart library for iOS developer who use Swift'
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
    s.source_files = 'AAInfographics', 'AAInfographics/**/*.{swift,html,js}'
    s.requires_arc = true
end
