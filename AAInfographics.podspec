Pod::Spec.new do |s|
    s.name         = 'AAInfographics'
    s.version      = '1.0.0'
    s.summary      = 'An elegant and friendly chart library for iOS developer who use Swift'
    s.homepage     = 'https://github.com/AAChartModel/AAChartKit-Swift'
    s.license      = 'MIT'
    s.authors      = {'An An' => '18256973864@163.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/AAChartModel/AAChartKit-Swift.git', :tag => s.version}
    s.source_files = 'AAInfographics', 'AAInfographics/**/*.{swift}'
    s.requires_arc = true
end