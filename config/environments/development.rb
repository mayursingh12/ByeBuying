Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  config.serve_static_files = true

  # config.paperclip_defaults = {
  #     :storage => :s3,
  #     :bucket => ENV['S3_BUCKET'],
  #     :s3_credentials => {
  #         :access_key_id => ENV['S3_BUCKET_ACCESS_KEY'],
  #         :secret_access_key => ENV['S3_BUCKET_SECRET']
  #     }
  # }

  config.paperclip_defaults = {
      :storage => :s3,
      :s3_credentials => {
          :bucket => 'byebuyingproductionnew',
          :access_key_id => 'AKIAIOMVRQJCQ3G6WYVQ',
          :secret_access_key => '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'
      }
      # :s3_credentials => {
      #     :bucket => 'byebuyingproduction',
      #     :access_key_id => 'AKIAJ2Z63SAWWU7TOE7Q',
      #     :secret_access_key => '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'
      # }
  }

  config.action_mailer.delivery_method = :letter_opener

end
