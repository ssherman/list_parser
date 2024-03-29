# frozen_string_literal: true

require_relative "lib/list_parser/version"

Gem::Specification.new do |spec|
  spec.name = "list_parser"
  spec.version = ListParser::VERSION
  spec.authors = ["Shane Sherman"]
  spec.email = ["shane.sherman@gmail.com"]

  spec.summary = "Parses a list of items from HTML"
  spec.description = "Parses a list of items from HTML"
  spec.homepage = "https://github.com/ssherman/list_parser"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ssherman/list_parser"
  spec.metadata["changelog_uri"] = "https://github.com/ssherman/list_parser/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "faraday", ">= 2.5.0"
  spec.add_dependency "nokogiri", ">= 1.13.0"
  spec.add_development_dependency "rubocop-minitest"
  spec.add_development_dependency "rubocop-rake"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
