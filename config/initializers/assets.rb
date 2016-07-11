# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.

Rails.application.config.assets.precompile += %w(admin.css admin.js customer.css customer.js vendors/theme/icheck.js vendors/theme/icheck.js vendors/theme/ionrangeslider.js vendors/theme/jqzoom.js vendors/theme/card-payment.js vendors/theme/owl-carousel.js vendors/theme/magnific.js vendors/theme/custom.js)