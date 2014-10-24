Manufaktur::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Expands the lines which load the assets
  config.assets.debug = true

  # Eager loading
  config.eager_load = false

  # Paperclip
  Paperclip.options[:command_path] = "/usr/local/bin/"

  config.paperclip_defaults = {
    :storage => :s3,
    :bucket => "lunge",
    :s3_credentials => YAML.load_file("#{Rails.root}/config/s3.yml"),
    :s3_host_name => "s3-eu-west-1.amazonaws.com",
    :s3_endpoint => "s3-eu-west-1.amazonaws.com",
    :path => "#{Rails.env}/:class/:attachment/:id/:basename_:style.:extension"
  }
end
