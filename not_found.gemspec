# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'not_found/version'

Gem::Specification.new do |spec|
  spec.name          = "not_found"
  spec.version       = NotFound::VERSION
  spec.authors       = ["Kris Leech"]
  spec.email         = ["kris.leech@gmail.com"]

  spec.summary       = "Rescue ActiveRecord::RecordNotFound for specific models"
  spec.description   = "Rescue ActiveRecord::RecordNotFound for specific models"
  spec.homepage      = "https://github.com/krisleech/not_found"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'activerecord'
end
