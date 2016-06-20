Pod::Spec.new do |s|
  s.name         = 'CBWRefresh'
  s.version      = '0.0.5'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/xeroxmx/CBWRefresh'
  s.authors      = {'codeChenBW'=>'861754186@qq.com'}
  s.summary      = 'A custom Refresh'
  s.platform     =  :ios, '7.0'
  s.source       =  {:git => 'https://github.com/xeroxmx/CBWRefresh.git',:tag => s.version}
  s.source_files = 'CBWRefresh/**/*.{h,m}'
  s.resource     = 'CBWRefresh/CBWRefresh.bundle'
  s.requires_arc = true
end