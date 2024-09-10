# frozen_string_literal: true

$LOAD_PATH.unshift(::File.join(::File.dirname(__FILE__), 'lib'))

require_relative 'lib/rentvine/version'

Gem::Specification.new do |spec|
  spec.name          = 'rentvine'
  spec.version       = Rentvine::VERSION
  spec.authors       = ['Wes Hays']
  spec.email         = ['weshays@gmail.com']

  spec.summary       = 'API wrapper for the Rentvine.com API'
  spec.description   = 'Rentvine is a web-based Property Management application that provides a RESTful API for developers to interact with. This gem is a wrapper for that API.'
  spec.homepage      = 'https://github.com/Launch-Engine/rentvine'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['source_code_uri'] = 'https://github.com/Launch-Engine/rentvine'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/Launch-Engine/rentvine/issues'
  spec.metadata['changelog_uri'] = 'https://github.com/Launch-Engine/rentvine/blob/main/CHANGELOG.md'
  spec.metadata['documentation_uri'] = 'https://docs.rentvine.com/'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'typhoeus', '~> 1.4'
  spec.add_dependency 'json', '~> 2.7'
  spec.add_dependency 'plissken', '~> 3.0'
  spec.add_dependency 'awrence', '~> 3.0'

end
