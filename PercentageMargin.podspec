Pod::Spec.new do |s|
  s.name        = "PercentageMargin"
  s.version     = "1.0.3"
  s.license     = { :type => "MIT" }
  s.homepage    = "https://github.com/marketplacer/PercentageMargin"
  s.summary     = "A library for creating percentage-based margins with Auto Layout constraints in iOS / Swift."
  s.description  = <<-DESC
                   This a library for creating percentage-based margins between views and their superviews in iOS. It allows, for example, to create an Auto Layout constraint for the trailing margin of 20% between the view and its superview. Because the margin is percentage-based its absolute size will adapt automatically when the superview size changes.
                   DESC
  s.authors     = { "Evgenii Neumerzhitckii" => "sausageskin@gmail.com" }
  s.source      = { :git => "https://github.com/marketplacer/PercentageMargin.git", :tag => s.version }
  s.screenshots  = "https://raw.githubusercontent.com/marketplacer/PercentageMargin/master/Graphics/overview.png"
  s.source_files = "PercentageMargin/**/*.swift"
  s.ios.deployment_target = "8.0"
end