module LocalResource
  class Engine < ::Rails::Engine
    isolate_namespace LocalResource

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    initializer "initialize" do
      require_relative "./instance"
    end
  end
end
