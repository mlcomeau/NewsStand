require_relative 'lib/news_stand/version'

Gem::Specification.new do |spec|
  spec.name          = "news_stand"
  spec.version       = News_Stand::VERSION
  spec.authors       = ["megan_comeau"]
  spec.email         = ["mlcomeau99@gmail.com"]

  spec.summary       = "View the top headlines from a diverse array of news sources."
  spec.homepage      = "https://github.com/mlcomeau/NewsStand"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mlcomeau/NewsStand"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
