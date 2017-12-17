require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Happy
  class Application < Rails::Application
  
    config.load_defaults 5.1

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options, :delete, :patch, :put]
      end
    end

    # config.to_prepare do
    #   DeviseController.respond_to :html, :json
    # end

    # config.time_zone = 'Hanoi'
    # config.active_record.default_timezone = :local
    # config.active_record.time_zone_aware_types = [:datetime, :time]

    # config.autoload_paths += %W(#{config.root}/lib) 
    # config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
