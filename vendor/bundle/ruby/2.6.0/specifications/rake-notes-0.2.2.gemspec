# -*- encoding: utf-8 -*-
# stub: rake-notes 0.2.2 ruby lib

Gem::Specification.new do |s|
  s.name = "rake-notes".freeze
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Fabio Rehm".freeze]
  s.date = "2018-06-05"
  s.description = "rake notes task for non-Rails' projects".freeze
  s.email = ["fgrehm@gmail.com".freeze]
  s.homepage = "https://github.com/fgrehm/rake-notes".freeze
  s.rubygems_version = "3.1.3".freeze
  s.summary = "rake notes task for non-Rails' projects".freeze

  s.installed_by_version = "3.1.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rake>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<colored>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<colored>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
