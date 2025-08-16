module MinhaGem
  class Engine < ::Rails::Engine
    isolate_namespace MinhaGem
    config.generators.api_only = true
  end
end
