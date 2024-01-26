Pod::Spec.new do |spec|

  spec.name         = "MealzUIModuleIOS"
  spec.version      = "1.0.0-beta"
  spec.summary      = "Mealz UI iOS SDK"
  spec.description  = <<-DESC
Mealz UI iOS SDK.
                   DESC

  spec.homepage     = "https://www.miam.tech"
  spec.license      = "GPLv3"
  spec.author             = { "Diarmuid McGonagle" => "it@miam.tech" }
  spec.platform     = :ios, "11.0"
  spec.swift_versions = "5.8"
  spec.resources = "Sources/MealzUIModuleIOS/Resources/**/*.png"

  
  spec.source       = { :git => "https://github.com/miamtech/MealzUIModuleIOS.git", :tag => "#{spec.version}" }

 
   spec.source_files = 'Sources/**/*.{h,m,swift}'
   
spec.dependency 'MiamIOSFramework', '~> 4.0'

end
