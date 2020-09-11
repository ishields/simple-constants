require_relative 'lib/simple_constants/version'

Gem::Specification.new do |spec|
  spec.name          = "simple-constants"
  spec.version       = SimpleConstants::VERSION
  spec.authors       = ["Ian Shields"]
  spec.email         = ["ian@shieldssoftware.com"]

  spec.summary       = %q{Easy way of defining easy to use constants through yml or class}
  spec.description   = %q{Easy way of defining easy to use constants through yml or class}
  spec.homepage      = "https://www.shieldssoftware.com"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #
  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end