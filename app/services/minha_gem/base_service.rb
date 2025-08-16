module MinhaGem
  # Classe base para serviços da gem.
  #
  # Convenções:
  # - Subclasses implementam o método de instância +#call+ com a lógica principal.
  # - Use +self.call+ para invocar o serviço de forma semântica: MeuServico.call(arg: 1)
  # - A configuração da gem está acessível via +config+ ou +enabled?+.
  #
  # Exemplos:
  #   class MinhaOperacao < MinhaGem::BaseService
  #     def initialize(user:, **)
  #       @user = user
  #     end
  #
  #     def call
  #       return failure(:disabled) unless enabled?
  #       # ... lógica ...
  #       success(data: { id: @user.id })
  #     end
  #   end
  #
  #   result = MinhaOperacao.call(user: current_user)
  #   if result.success?
  #     # ...
  #   else
  #     # tratar erro
  #   end
  #
  # O objeto de retorno padrão é um Struct simples com helpers.
  class BaseService
    Result = Struct.new(:success, :data, :error, keyword_init: true) do
      def success? = !!success
      def failure? = !success?
    end

    class << self
      # Atalho para executar o serviço sem instanciar manualmente.
      def call(*args, **kwargs, &block)
        new(*args, **kwargs).call(&block)
      end
    end

    private

    # Acesso direto à configuração da gem.
    def config
      MinhaGem.config
    end

    # Helper semântico para verificar se a funcionalidade está habilitada.
    def enabled?
      config.enabled
    end

    # Helpers para construir resultados uniformes.
    def success(data: nil)
      Result.new(success: true, data: data, error: nil)
    end

    def failure(error = :unknown, data: nil)
      Result.new(success: false, data: data, error: error)
    end
  end
end
