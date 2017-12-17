Rails.application.configure do

  config.cache_classes = false

  config.eager_load = false   # Do not eager load code on boot.

  config.consider_all_requests_local = true   # Show full error reports.

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => 'public, max-age=172800'
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.active_support.deprecation = :debug  # :log Print deprecation notices to the Rails logger.
  config.active_record.migration_error = :page_load   # Raise an error on page load if there are pending migrations.

  config.assets.debug = true
  config.assets.quiet = true   # Suppress logger output for asset requests.
  config.assets.compile = true
  
  config.action_view.raise_on_missing_translations = false

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.action_mailer.delivery_method = :letter_opener # :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

end