Pod::Spec.new do |s|
  s.name         = "KILogInject"
  s.version      = "0.1.0"
  s.summary      = "NSLog() without NSLog()! Logger injection."
  s.homepage     = "https://github.com/kaiinui/KILogInject"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/kaiinui/KILogInject.git", :tag => "v0.1.0" }
  s.source_files  = "KILogInject/Classes/**/*.{h,m}"
  s.requires_arc = true
  s.dependency "Aspects"
  s.platform = "ios", '7.0'
end

