# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vtt2an/version'

Gem::Specification.new do |spec|
  spec.name          = "vtt2an"
  spec.version       = Vtt2An::VERSION
  spec.authors       = ["James Smith"]
  spec.email         = ["james@floppy.org.uk"]

  spec.summary       = %q{Convert WebVTT subtitles to Akoma Ntoso transcripts}
  spec.homepage      = "https://github.com/Floppy/vtt2an"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "coveralls", "~> 0.8"
  spec.add_dependency "webvtt-ruby", "~> 0.3"
  spec.add_dependency "activesupport", "~> 5.0"
end
