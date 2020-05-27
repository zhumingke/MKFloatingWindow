

Pod::Spec.new do |spec|

  

  spec.name         = "MKFloatingWindow"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of MKFloatingWindow."

  
  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "https://github.com/zhumingke/ZMKSpecs"
  


  

  spec.license      = "MIT (example)"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  

  spec.author             = { "zhumingke" => "2107565476@qq.com" }
  

 



  

  spec.source       = { :git => "https://github.com/zhumingke/ZMKSpecs.git", :tag => "#{spec.version}" }



  spec.source_files  = "MKFloatingWindow", "MKFloatingWindow/MKFloating/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"


 

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"




end
