$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = 'fortitude-caching'
  s.version = '0.0.1'

  s.required_ruby_version = Gem::Requirement.new('>= 2.0.0')
  s.authors = ['Adam Becker']
  s.summary = 'Integrates Rails fragment caching with Fortitude.'
  s.email = 'adam@dobt.co'
  s.license = 'MIT'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {features,spec}/*`.split("\n")

  s.homepage = 'https://github.com/dobtco/fortitude-caching'

  s.add_dependency 'rails', '>= 4.0.0', '< 6.0'
  s.add_dependency 'fortitude', '~> 0.9.5'

  s.add_development_dependency 'rspec-rails', '~> 3.5', '>= 3.5.2'
  s.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.12'
end
