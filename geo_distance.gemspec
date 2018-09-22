
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "geo_distance/version"

Gem::Specification.new do |spec|
  spec.name          = "geo_distance"
  spec.version       = GeoDistance::VERSION
  spec.authors       = ["Zeljko Kalezic"]
  spec.email         = ["zeljkokalezic@gmail.com"]

  spec.summary       = "Generates list of places within desired distance from a point."
  spec.homepage      = "https://github.com/zeljkokalezic/geo_locator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "rubocop"

  spec.add_dependency "thor"
end
