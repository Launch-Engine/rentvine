# frozen_string_literal: true

$LOAD_PATH.unshift(::File.join(::File.dirname(__FILE__), 'lib'))

require_relative 'lib/rentvine/version'

Gem::Specification.new do |spec|
  spec.name          = 'rentvine'
  spec.version       = Rentvine::VERSION
  spec.authors       = ['Wes Hays']
  spec.email         = ['weshays@gmail.com']

  spec.summary       = 'API wrapper for the Rentvine API'
  spec.description   = 'API wrapper for the Rentvine API'
  spec.homepage      = 'https://github.com/Launch-Engine/rentvine'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Launch-Engine/rentvine'
  spec.metadata['changelog_uri'] = 'https://github.com/Launch-Engine/rentvine'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  # spec.bindir        = 'exe'
  # spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'typhoeus', '~> 1.4'
  spec.add_dependency 'json', '~> 2.7'
  spec.add_dependency 'plissken', '~> 3.0'
  spec.add_dependency 'awrence', '~> 3.0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
