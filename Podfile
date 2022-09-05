# Uncomment the next line to define a global platform for your project
 platform :ios, '14.0'


def testing_pods
  pod 'Quick'
  pod 'Nimble'
end

target 'NewsApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NewsApp
  pod 'SDWebImage'
  pod 'AMProgressHUD'

  target 'NewsAppTests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

end

target 'Shared' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Shared
  pod 'LanguageManager-iOS'

  target 'SharedTests' do
    inherit! :search_paths
    # Pods for testing
    testing_pods
  end

end
