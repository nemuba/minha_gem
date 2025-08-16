# frozen_string_literal: true

require "rails/generators"

module MinhaGem
  module Generators
    # Generator de instalação: cria arquivo de initializer com configuração padrão.
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)
      desc "Instala MinhaGem adicionando initializer de configuração em config/initializers/minha_gem.rb"

      def create_initializer
        template "minha_gem.rb", "config/initializers/minha_gem.rb"
      end

      def show_readme
        say <<~MSG
          ✅ MinhaGem instalado.
          Arquivo de configuração: config/initializers/minha_gem.rb
          Ajuste os valores conforme necessário.
        MSG
      end
    end
  end
end
