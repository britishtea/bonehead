# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'insist/version'

Gem::Specification.new do |s|
  s.name          = "insist"
  s.version       = Insist::VERSION
  s.authors       = ["Jip van Reijsen"]
  s.email         = ["jipvanreijsen@gmail.com"]
  s.homepage      = "https://github.com/britishtea/insist"
  s.summary       = "Retry blocks of code when they raise an exception."
  s.description   = "Retry blocks of code when they raise an exception."
  s.license       = "MIT"

  s.files         = `git ls-files app lib`.split("\n")
  
  s.add_development_dependency "cutest", "~> 1.2.0"
end
