# encoding: utf-8

$LOAD_PATH: << File.expand_path('../lib', __FILE__)

require 'rubydoop/version'

Gem::Specification.new do |s|
  s.name        = 'rubydoop'
  s.version     = Rubydoop::VERSION.dup
  s.platform    = 'java'
  s.authors     = ['Theo Hultberg']
  s.email       = ['theo@iconara.net']
  s.homepage    = 'http://github.com/iconara/rubydoop'
  s.license     = 'Apache License 2.0'
  s.summary     = 'Write Hadoop jobs in Ruby'
  s.description = 'Rubydoop embeds a JRuby runtime in Hadoop, letting you write map reduce code in Ruby without using the streaming APIs'

  s.rubyforge_project = 'rubydoop'

  s.add_runtime_dependency 'puck', '~> 1.2'

  s.files         = Dir['lib/**/*.{rb,jar}']
  s.require_paths = %w(lib)
end
