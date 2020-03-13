
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "songle-song-uri-parser/version"

Gem::Specification.new do |spec|
  spec.name          = "songle-song-uri-parser"
  spec.version       = ::SongleSongURIParser::VERSION
  spec.authors       = ["Takahiro INOUE"]
  spec.email         = ["takahiro.inoue@aist.go.jp"]

  spec.summary       = %w{
    The Songle Song URI parser is a gem package providing class to handle the Song URI.
  }.join(" ")
  spec.description   = %w{
    The Songle Song URI parser is a gem package providing class to handle the Song URI.
    The Song URI is an unique ID of the song that is managed by the Songle.
    This gem package can parse it.
  }.join(" ")
  spec.homepage      = "https://github.com/hinata/songle-song-uri-parser"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = "~> 2.4"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
end
