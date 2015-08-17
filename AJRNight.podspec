Pod::Spec.new do |s|
  s.name     = 'AJRNight'
  s.version  = '1.0.0'
  s.platform = :ios, '7.0'
  s.summary  = 'Lightweight iOS framework for adding night mode to projects'
  s.homepage = 'https://github.com/AmarJayR/AJRNight'
  s.author   = { 'Amar Ramachandran' => 'amarrmchndrn1@gmail.com' }
  s.source   = { :git => 'https://github.com/AmarJayR/AJRNight.git', :tag => s.version.to_s }
  s.license      = { :type => 'Apache License, Version 2.0' }
  s.source_files = 'AJRNight/*.{h,m}', 'AJRNight/**/*.{h,m}'
  s.header_mappings_dir =  'AJRNight'

  s.requires_arc = true
end
