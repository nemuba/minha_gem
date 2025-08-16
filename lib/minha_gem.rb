require "minha_gem/version"
require "minha_gem/engine"
require "active_support/configurable"

# Namespace principal da gem.
# Fornece uma interface de configuração baseada em ActiveSupport::Configurable.
#
# Exemplos de uso (em um initializer da aplicação host, ex: config/initializers/minha_gem.rb):
#   MinhaGem.configure do |config|
#     config.enabled = false
#     config.api_key = ENV["MINHA_GEM_API_KEY"]
#   end
#
# A qualquer momento você pode ler:
#   MinhaGem.config.enabled
#   MinhaGem.config.api_key
module MinhaGem
  include ActiveSupport::Configurable

  # Define atributos configuráveis.
  config_accessor :enabled, :api_key

  # Define valores padrão.
  config.enabled = true
  config.api_key = nil

  class << self
    # DSL para configurar a gem.
    def configure
      yield config if block_given?
    end
  end
end
