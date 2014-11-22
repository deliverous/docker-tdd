Gem::Specification.new do |spec|
  spec.name = "docker-tdd"
  spec.version = "0.0.1"
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Deliverous R&D"]
  spec.email = ["contact@deliverous.com"]
  spec.homepage = "http://deliverous.com/"
  spec.summary = "Minitest extention to make container test"
  spec.description = ""

  spec.required_rubygems_version = ">= 1.3.6"

  spec.add_dependency 'docker-api'
  spec.add_dependency 'minitest'

  spec.files = Dir["{lib}/**/*.rb", "{lib}/**/*.erb", "{bin}/*", "{lib}/**/*.rake", "{lib}/**/*.yml", "LICENSE", "*.md", "templates/**"]
  spec.bindir = 'bin'

  spec.require_path = 'lib'
  #spec.license       = 'MIT'
end
