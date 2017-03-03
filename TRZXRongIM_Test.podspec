Pod::Spec.new do |s|
  s.name         = "TRZXRongIM_Test"
  s.version      = "0.0.2"
  s.summary      = "A short description of TRZXRongIM_Test."
  s.homepage     = "https://github.com/382780396/TRZXRongIM_Test"
  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "biganxin" => "bigx@mmwipo.com" } 
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/382780396/TRZXRongIM_Test.git", :tag => "0.0.1" } 
  s.source_files  = "TRZXRongIM_Test", "TRZXRongIM_Test/TRZXRongIM_Test/*.{h,m}"
  s.requires_arc = true
  s.dependency "ReactiveCocoa", "~> 2.5"
  s.dependency "MJRefresh"
  s.dependency "MJExtension"
  s.dependency "Masonry"
  s.dependency "SDWebImage"
end
