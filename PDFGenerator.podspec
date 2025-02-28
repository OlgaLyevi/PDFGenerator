#
# Be sure to run `pod lib lint PDFGenerator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PDFGenerator'
  s.version          = '0.1.0'
  s.summary          = 'A Swift library to convert HTML to PDF.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Converts HTML pages to PDF'

  s.homepage         = 'https://github.com/OlgaLyevi/PDFGenerator'
  
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'OlgaLyevi' => 'levi.olga@gmail.com' }
  s.source           = { :git => 'https://github.com/OlgaLyevi/PDFGenerator.git', :tag => s.version.to_s }
  
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'PDFGenerator/Classes/**/*'
  
  # s.resource_bundles = {
  #   'PDFGenerator' => ['PDFGenerator/Assets/*.png']
  # }

   s.swift_version = '5.0'
   
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
   s.dependency 'UIKit'
   s.dependency 'WebKit'
end
