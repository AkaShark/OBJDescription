Pod::Spec.new do |s|

  s.name         = "OBJDescription"   

  s.version      = "0.0.1"   
  s.summary      = "about iOS object description. Make log information better"   
  s.description  = <<-DESC
                   about iOS object description. Make log information better
                   DESC

  s.homepage     = "https://github.com/AkaShark/OBJDescription.git"
  s.license = { :type => 'MIT', :text => <<-LICENSE
         Copyright PPAbner 2016-2017
          LICENSE
      }
  s.author             = { "Sharker" => "aaksharker@gmail.com" }
  s.social_media_url   = "https://akashark.github.io/"

  s.platform     = :ios
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "https://github.com/AkaShark/OBJDescription.git", :tag => s.version }

  s.source_files = 'OBJDescription/**/*'

  s.requires_arc = true

end