#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'health_hs'
  s.version          = '2.0.1'
  s.summary          = 'Wrapper for the iOS HealthKit and Android GoogleFit services.'
  s.description      = <<-DESC
Wrapper for the iOS HealthKit and Android GoogleFit services.
                       DESC
  s.homepage         = 'https://gitlab.com/neophranpublic/flutter-health-neo'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Neophran' => 'murat/nar@neophran.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '13.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end

