# frozen_string_literal: true

require_relative "lib/chargify_wrapper/version"

Gem::Specification.new do |spec|
  spec.name = "chargify_wrapper"
  spec.version = ChargifyWrapper::VERSION
  spec.authors = ["Reynaldo Scardinho"]
  spec.email = ["rscardinho@87labs.com"]

  spec.summary = "Chargify API wrapper for internal use"
  spec.homepage = "https://github.com/blinkbid/chargify_wrapper"
  spec.required_ruby_version = ">= 2.7.8"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/blinkbid/chargify_wrapper"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency("rake", "~> 13.0")
  spec.add_development_dependency("dotenv", "~> 2.8")
  spec.add_development_dependency("webmock", "~> 3.18")
  spec.add_development_dependency("vcr", "~> 6.2")
  spec.add_development_dependency("rspec", "~> 3.0")
  spec.add_development_dependency("rubocop", "~> 1.52")
  spec.add_development_dependency("standard", "~> 1.25")
  spec.add_development_dependency("rubocop-performance", "~> 1.18")
  spec.add_development_dependency("rubocop-rspec", "~> 2.23")
  spec.add_runtime_dependency("httplog", "~> 1.6.3")
  spec.add_runtime_dependency("activesupport", "~> 6.1", ">= 6.1.7.7")
  spec.add_runtime_dependency("activeresource", "~> 6.1.0")
end
