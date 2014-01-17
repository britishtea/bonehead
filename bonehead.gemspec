# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'bonehead/version'

Gem::Specification.new do |s|
  s.name          = "bonehead"
  s.version       = Bonehead::VERSION
  s.authors       = ["Jip van Reijsen"]
  s.email         = ["jipvanreijsen@gmail.com"]
  s.homepage      = "https://github.com/britishtea/bonehead"
  s.summary       = "Retry blocks of code when they raise an exception."
  s.description   = "Retry blocks of code when they raise an exception."
  s.license       = "MIT"

  s.files         = `git ls-files app lib`.split("\n")

  s.cert_chain  = ['certs/britishtea.pem']
  s.signing_key = File.expand_path("~/.gem/gem-private_key.pem") if $0 =~ /gem\z/
  
  s.add_development_dependency "cutest", "~> 1.2"
end
