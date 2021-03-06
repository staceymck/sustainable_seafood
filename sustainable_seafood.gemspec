require_relative 'lib/sustainable_seafood/version'

Gem::Specification.new do |spec|
  spec.name          = "sustainable_seafood"
  spec.version       = SustainableSeafood::VERSION
  spec.authors       = ["Stacey McKnight"]
  spec.email         = ["mcknight.stm@gmail.com"]

  spec.summary       = %q{Seafood sustainability data}
  spec.description   = %q{Tool for accessing sustainability-related data for 100+ marine species via FishWatch API.}
  spec.homepage      = "https://github.com/staceymck/sustainable_seafood"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/staceymck/sustainable_seafood"
  spec.metadata["changelog_uri"] = "https://github.com/staceymck/sustainable_seafood"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "word_wrap"
  spec.add_dependency "colorize"
  spec.add_dependency "nokogiri"

end
