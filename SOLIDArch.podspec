#
# Be sure to run `pod lib lint SOLIDArch.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SOLIDArch'
  s.version          = '0.0.1'
  s.summary          = 'The basic classes for implementing SOLID architecture in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
The basic classes for implementing SOLID architecture in Swift.
Contains universal `UITableViewDataSource` implementation.
                       DESC

  s.homepage         = 'https://github.com/ws233/SOLIDArch'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Cyril Makankov' => 'kvmakankov@gmail.com' }
  s.source           = { :git => 'https://github.com/ws233/SOLIDArch.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'
  s.swift_versions = '5.0'

  s.source_files = 'SOLIDArch/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SOLIDArch' => ['SOLIDArch/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
