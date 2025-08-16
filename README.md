# MinhaGem

Short description and motivation.

## Usage

### Configuração

Em um initializer da aplicação host (ex: `config/initializers/minha_gem.rb`):

```ruby
MinhaGem.configure do |config|
 config.enabled = true
 config.api_key = ENV["MINHA_GEM_API_KEY"]
end
```

### Serviços

Crie serviços herdando de `MinhaGem::BaseService` para padronizar lógica e acesso à configuração.

Recursos fornecidos:

- `config` e `enabled?` para acessar `MinhaGem.config`.
- Método de classe `.call` que instancia e executa.
- Helpers `success(data:)` e `failure(error, data:)` retornando um objeto resultado com:
 	- `success?` / `failure?`
 	- `data`
 	- `error`

Exemplo:

```ruby
class PublicarCoisa < MinhaGem::BaseService
 def initialize(registro:)
  @registro = registro
 end

 def call
  return failure(:disabled) unless enabled?
  # ... lógica de publicação ...
  success(data: { id: @registro.id })
 end
end

resultado = PublicarCoisa.call(registro: objeto)
if resultado.success?
 puts "Publicado: #{resultado.data[:id]}"
else
 Rails.logger.warn("Falhou: #{resultado.error}")
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem "minha_gem"
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install minha_gem
```

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
