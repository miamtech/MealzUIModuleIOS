Pod::Spec.new do |spec|
        spec.name         = 'MealzUIModuleIOS'
        spec.version      = '1.0.0'
        spec.summary      = 'Mealz UI iOS SDK'
        spec.homepage     = 'https://www.miam.tech'
        spec.description  = <<-DESC
            Mealz UI iOS SDK.
            DESC
        spec.license      = "GPLv3"
        spec.author             = { "Diarmuid McGonagle" => "it@miam.tech" }
        spec.swift_version = '5.8'
        spec.platform     = :ios, "12.0"
        spec.source       = { :git => "https://github.com/miamtech/MealzUIModuleIOS.git", :tag => "#{spec.version}" }
        
        spec.source_files = 'Sources/**/*.{h,m,swift}'
        spec.dependency 'MealzIOSFramework', '~> 4.0.0'
        spec.static_framework = true
        spec.resource_bundles = {'MealzUIModuleIOS' => ['*.xcprivacy']}
end
