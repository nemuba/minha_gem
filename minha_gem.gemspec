require_relative "lib/minha_gem/version"

Gem::Specification.new do |spec|
  spec.name        = "minha_gem"
  spec.version     = MinhaGem::VERSION
  spec.authors     = [ "Alef ojeda de Oliveira" ]
  spec.email       = [ "nemubatubag@gmail.com" ]
  spec.homepage    = "https://github.com/nemuba/minha_gem"
  spec.summary     = "Minha Gem"
  spec.description = "Uma descrição da minha gem"
  spec.license     = "MIT"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 8.0.2"

  # Dependências de desenvolvimento / teste
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rails-omakase"
end
