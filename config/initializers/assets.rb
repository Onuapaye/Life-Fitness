# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.1'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.paths << Rails.root.join('assets', 'stylesheets', 'chain', 'images' )
# Rails.application.config.assets.paths << Rails.root.join('assets', 'stylesheets', 'fitnezz_css', 'scss' )

# Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'ajax' )
# Rails.application.config.assets.precompile += %w(vendor/assets/fonts/*)
# Rails.application.config.assets.precompile += %w(vendor/assets/images/*)
# Rails.application.config.assets.paths += Dir["#{Rails.root}/vendor/assets/*"].sort_by { |dir| -dir.size }

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# Custom theme css and js file calls
Rails.application.config.assets.precompile += %w( chain/style.default.css )
Rails.application.config.assets.precompile += %w( chain/morris.css )
Rails.application.config.assets.precompile += %w( chain/select2.css )
Rails.application.config.assets.precompile += %w( custom_bis.css)

Rails.application.config.assets.precompile += %w( chain/jquery-1.11.1.min.js )
Rails.application.config.assets.precompile += %w( chain/jquery-migrate-1.2.1.min.js )
Rails.application.config.assets.precompile += %w( chain/jquery-ui-1.10.3.min.js )
Rails.application.config.assets.precompile += %w( chain/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( chain/modernizr.min.js )
Rails.application.config.assets.precompile += %w( chain/pace.min.js )
Rails.application.config.assets.precompile += %w( chain/retina.min.js )
Rails.application.config.assets.precompile += %w( chain/jquery.cookies.js )

Rails.application.config.assets.precompile += %w( chain/flot/jquery.flot.min.js )
Rails.application.config.assets.precompile += %w( chain/flot/jquery.flot.resize.min.js )
Rails.application.config.assets.precompile += %w( chain/flot/jquery.flot.spline.min.js )
Rails.application.config.assets.precompile += %w( chain/jquery.sparkline.min.js )
Rails.application.config.assets.precompile += %w( chain/morris.min.js )
Rails.application.config.assets.precompile += %w( chain/raphael-2.1.0.min.js )
Rails.application.config.assets.precompile += %w( chain/bootstrap-wizard.min.js )
Rails.application.config.assets.precompile += %w( chain/jquery.validate.min.js )
Rails.application.config.assets.precompile += %w( chain/select2.min.js )

Rails.application.config.assets.precompile += %w( chain/custom.js )
Rails.application.config.assets.precompile += %w( chain/dashboard.js )

Rails.application.config.assets.precompile += %w( chain/forms-wizards-validations.js )

Rails.application.config.assets.precompile += %w(chain/fonts/*)
Rails.application.config.assets.precompile += %w(assets/stylesheets/chain/images/*)

# CSS AND JS LINKS FOR THE FITNEZZ THEME RESOURCES
Rails.application.config.assets.precompile += %w( fitnezz_css/bootstrap.css )
Rails.application.config.assets.precompile += %w( fitnezz_css/animate.css )
Rails.application.config.assets.precompile += %w( fitnezz_css/owl.carousel.min.css )

Rails.application.config.assets.precompile += %w( fitnezz_css/magnific-popup.css )

# FONTAWESOME
Rails.application.config.assets.precompile += %w( fitnezz_css/fonts/ionicons/css/ionicons.min.css )
Rails.application.config.assets.precompile += %w( fitnezz_css/fonts/fontawesome/css/font-awesome.min.css )

Rails.application.config.assets.precompile += %w( fitnezz_css/style.css )

# Rails.application.config.assets.precompile += %w(fitnezz_css/scss/_variables.scss)
# Rails.application.config.assets.precompile += %w(fitnezz_css/scss/*.css)

# JS FILES
Rails.application.config.assets.precompile += %w( fitnezz_js/jquery-3.2.1.min.js )
Rails.application.config.assets.precompile += %w( fitnezz_js/popper.min.js )
Rails.application.config.assets.precompile += %w( fitnezz_js/bootstrap.min.js )
Rails.application.config.assets.precompile += %w( fitnezz_js/owl.carousel.min.js )
Rails.application.config.assets.precompile += %w( fitnezz_js/jquery.waypoints.min.js )

Rails.application.config.assets.precompile += %w( fitnezz_js/jquery.magnific-popup.min.js )
Rails.application.config.assets.precompile += %w( fitnezz_js/magnific-popup-options.js )

Rails.application.config.assets.precompile += %w( fitnezz_js/main.js )

#IMG FILES
Rails.application.config.assets.precompile += %w(assets/stylesheets/fitnezz_css/img/*)