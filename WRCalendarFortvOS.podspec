#
#  Be sure to run `pod spec lint WRCalendarFortvOS.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "WRCalendarFortvOS"
  s.version      = "0.1.3"
  s.summary      = "calendar for tvOS"
  s.description  = "WRCalendarFortvOS is based on WRCalendar" 
  s.homepage     = "https://github.com/sorashido/WRCalendarFortvOS"
  s.license      = "MIT"
  s.author             = { "shido" => "poporotylm@gmail.com" }
  s.source       = { :git => "https://github.com/sorashido/WRCalendarFortvOS.git", :tag => "v0.1.3" }
  s.source_files  = "WRCalendarFortvOS/**/*"
	s.platforms = { :tvos => "11.0"}
  s.resource_bundles = {
    'WRCalendarViewFortvOS' => ['WRCalendarFortvOS/**/*.{storyboard,xib}']
  }
  s.dependency 'DateToolsSwift'
end
