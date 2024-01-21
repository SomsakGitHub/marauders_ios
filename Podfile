#def
def alamofire_pods
  pod 'Alamofire'
end

def rx_pods
  pod 'RxSwift'
    pod 'RxCocoa'
end

target 'CoreKit' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CoreKit
  alamofire_pods
end

target 'Marauders' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Marauders
  rx_pods
end

target 'NetworkKit' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NetworkKit
  alamofire_pods
end

target 'RepositoryKit' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RepositoryKit
  rx_pods
  alamofire_pods
end
