# Uncomment this line to define a global platform for your project
platform :ios, '10.0'

# ignore all warnings from all pods
inhibit_all_warnings!

# Common Pods for every PokeCodeTest target
def PokeCodeTestSharedPods
  pod 'SnapKit', '5.0.0'
  pod 'RxSwift', '5.0.0'
  pod 'RxCocoa', '5.0.0'
  pod 'Action', '4.0.0'
  pod 'RxAlamofire', '5.0.0'
  pod 'MBProgressHUD'
  pod 'Kingfisher'
end

target 'PokeCodeTest' do
  use_frameworks!

  PokeCodeTestSharedPods()
end

target 'PokeCodeTestUITests' do
  use_frameworks!

  PokeCodeTestSharedPods()
end
