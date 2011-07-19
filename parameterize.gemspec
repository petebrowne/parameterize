# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'parameterize/version'

Gem::Specification.new do |s|
  s.name        = 'parameterize'
  s.version     = Parameterize::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = %w(Pete Browne)
  s.email       = %w(me@petebrowne.com)
  s.homepage    = 'http://github.com/petebrowne/parameterize'
  s.summary     = %{The simplest permalink/slug solution for ActiveRecord >= 3.0}
  s.description = %{It uses ActiveSupport's String#parameterize to create the slug. There are no validations. No slug history. No extra tables or models.}

  s.rubyforge_project = 'parameterize'
  
  s.add_dependency             'activerecord',  '~> 3.0'
  s.add_dependency             'activesupport', '~> 3.0'
  s.add_development_dependency 'rspec',         '~> 2.6.0'
  s.add_development_dependency 'sqlite3-ruby',  '~> 1.3.3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w(lib)
end
