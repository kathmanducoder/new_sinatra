
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "new_sinatra/version"

Gem::Specification.new do |spec|
  spec.name          = "new_sinatra"
  spec.version       = NewSinatra::VERSION
  spec.authors       = ["kathmanducoder"]
  spec.email         = ["kathmanducoder@gmail.com"]

  spec.summary       = %q{A Ruby gem that comes with an executable to help create a new Sinatra app.}
  spec.description   = %q{A Ruby utility gem to help you get started with a brand new Sinatra app. This gem helps you lay out project/file structure, like 'rails new' does for Rails.}
  spec.homepage      = "https://github.com/kathmanducoder/new_sinatra"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = "new_sinatra"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
end
