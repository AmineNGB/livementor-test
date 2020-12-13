require_relative 'lib/jsontocsv/version'

Gem::Specification.new do |spec|
  spec.name          = "jsontocsv"
  spec.version       = Jsontocsv::VERSION
  spec.authors       = ["amine neghbel"]
  spec.email         = ["amineneghbel@gmail.com"]

  spec.summary       = %q{this gem is for the livementor test.}
  spec.description   = %q{with this gem you can convert json to csv}
  spec.homepage      = "https://github.com/AmineNGB/livementor-gem"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/AmineNGB/livementor-gem"
  spec.metadata["changelog_uri"] = "https://github.com/AmineNGB/livementor-gem"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'rspec',  '>= 3.0'
end
