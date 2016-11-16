# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( user_home.css )
Rails.application.config.assets.precompile += %w( user_new.css )
Rails.application.config.assets.precompile += %w( home.css )
Rails.application.config.assets.precompile += %w( article_show.css ) 
Rails.application.config.assets.precompile += %w( doctor_home.css )
Rails.application.config.assets.precompile += %w( doctor_signup.css )
Rails.application.config.assets.precompile += %w( user_index.css )
Rails.application.config.assets.precompile += %w( user_home_mobile.css )
Rails.application.config.assets.precompile += %w( nv.d3.css )
Rails.application.config.assets.precompile += %w( d3.v3.min.js )
Rails.application.config.assets.precompile += %w( nd.d3 )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
