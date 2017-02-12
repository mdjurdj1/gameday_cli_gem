# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gameday_cli_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "gameday_cli_gem"
  spec.version       = GamedayCliGem::VERSION
  spec.authors       = ["'Michael Djurdjevic'"]
  spec.email         = ["'mdjurdj1@binghamton.edu'"]

  spec.summary       = %q{A Ruby CLI gem which lists the days' upcoming and in-progress sporting events.}
  spec.homepage      = "https://github.com/mdjurdj1/gameday_cli_gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  # spec.executables << 'game-day'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~>0.10.4"
  spec.add_development_dependency "nokogiri", "~>1.7"
end
