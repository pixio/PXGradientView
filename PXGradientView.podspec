Pod::Spec.new do |s|
  s.name             = "PXGradientView"
  s.version          = "0.1.2"
  s.summary          = "It's a gradient.  It's easy."
  s.description      = <<-DESC
                       A view that allows you to create a gradient with as little as one line of code.
                       DESC
  s.homepage         = "https://github.com/pixio/PXGradientView/"
  s.license          = 'MIT'
  s.author           = { "Daniel Blakemore" => "DanBlakemore@gmail.com" }
  s.source = {
   :git => "https://github.com/pixio/PXGradientView.git",
   :tag => s.version.to_s
  }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'UIColor-MoreColors'
end
