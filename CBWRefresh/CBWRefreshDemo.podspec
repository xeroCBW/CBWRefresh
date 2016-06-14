Pod::Spec.new do |s|
  s.name         = 'CBWRefreshDemo'
  s.version      = '0.0.1'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/xeroxmx/CBWRefreshDemo'
  s.authors      = {'codeChenBW'=>'861754186@qq.com'}
  s.summary      = 'A custom Refresh'

  s.platform     =  :ios, '7.0'
s.source       =  {:git => 'https://github.com/xeroxmx/CBWRefreshDemo.git',:tag => s.version}
  s.source_files = 'CBWRefresh/**/*.{h,m}'
  s.frameworks   =  'CBWRefresh/MJRefresh.bundle'
  s.requires_arc = true
  
# Pod Dependencies

end