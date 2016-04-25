#
# Be sure to run `pod lib lint ETiOSToolbox.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ETiOSToolbox"
  s.version          = "0.1.0"
  s.summary          = "A helpful toolbox for iOS development."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "A helpful util toolbox for iOS development. Including some UI component enhancement, file/plist operation，Data encryption, map/location calculation, MBProgressHUD integration..."

  s.homepage         = "https://github.com/EricTan-TJH/ETiOSToolbox"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "EricTan" => "erictan.tjh@gmail.com" }
  s.source           = { :git => "https://github.com/EricTan-TJH/ETiOSToolbox.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'ETiOSToolbox/Classes/**/*'
  s.resource_bundles = {
    'ETiOSToolbox' => ['ETiOSToolbox/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit', 'CoreLocation'
  s.dependency 'MBProgressHUD', '~> 0.9.2'
  s.dependency 'Masonry', '~> 1.0.0'

end
