# frozen_string_literal: true

# Inicializador gerado por `rails g minha_gem:install`.
# Ajuste as opções conforme necessário.
# Documentação rápida:
#   MinhaGem.configure do |config|
#     config.enabled = true                # Ativa/desativa funcionalidades da gem
#     config.api_key = ENV["MINHA_GEM_API_KEY"] # Chave de API (se aplicável)
#   end

MinhaGem.configure do |config|
  # Ativa ou desativa a gem globalmente.
  config.enabled = true

  # Defina uma API key (ou mantenha nil se não utilizada).
  config.api_key = ENV.fetch("MINHA_GEM_API_KEY", nil)
end
