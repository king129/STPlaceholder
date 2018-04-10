
Pod::Spec.new do |s|
  s.name             = 'STPlaceholder'
  s.version          = '1.0.0'
  s.summary          = 'LightWeight placeholder for UITableView & UICollectionView'


  s.description      = 'LightWeight And  placeholder for UITableView & UICollectionView'

  s.homepage         = 'https://github.com/czqasngit/STPlaceholder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'czqasngit' => 'czqasn_6@163.com' }
  s.source           = { :git => 'https://github.com/czqasngit/STPlaceholder.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'STPlaceholder/Classes/**/*'

end
