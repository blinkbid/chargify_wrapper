# frozen_string_literal: true

require_relative "lib/chargify_wrapper/version"

Gem::Specification.new do |spec|
  spec.name = "chargify_wrapper"
  spec.version = ChargifyWrapper::VERSION
  spec.authors = ["Reynaldo Scardinho"]
  spec.email = ["rscardinho@87labs.com"]

  spec.summary = "Chargify API wrapper for internal use"
  spec.homepage = "https://github.com/blinkbid/chargify_wrapper"
  spec.required_ruby_version = ">= 3.0.0"

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

  spec.add_runtime_dependency("rspec", "~> 3.0")
  spec.add_runtime_dependency("rubocop", "~> 1.52")
  spec.add_runtime_dependency("standard", "~> 1.25")
  spec.add_runtime_dependency("rubocop-performance", "~> 1.18")
  spec.add_runtime_dependency("rubocop-rspec", "~> 2.23")
  spec.add_runtime_dependency("activeresource", "~> 6.0")
end
