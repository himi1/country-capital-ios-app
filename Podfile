platform :ios, '9.0'

source 'https://github.com/mojtabacazi/Specs.git'
source 'https://github.com/CocoaPods/Specs.git'

# Comment this line if you're not using Swift and don't want to use dynamic frameworks
use_frameworks!
    
def core_pods 
    
    #pod 'Alamofire'
    #pod 'SwiftyJSON', :git => 'https://github.com/appsailor/SwiftyJSON.git', :branch => 'swift3'
    #pod 'SWXMLHash'
    #pod 'GoogleAnalytics'   
    #pod 'GooglePlaces'
    #pod 'GooglePlacePicker'
    #pod 'GoogleMaps'
    #pod 'Google/SignIn'
    #pod 'FacebookLogin'
    #pod 'SDWebImage/WebP'
    #pod 'Firebase/Core'
    #pod 'Firebase/Auth'
    #pod 'Firebase/Messaging'
    #pod 'SwiftWebViewProgress'
    #pod 'FBAnnotationClusteringSwift', :git => 'https://github.com/ribl/FBAnnotationClusteringSwift.git'
    #pod 'GEOSwift', :git => 'https://github.com/mojtabacazi/GEOSwift.git', :branch => 'develop'

end

target 'test123' do
    core_pods
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end



