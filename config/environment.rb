# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
OAUTH_CONFIG = YAML.load_file("#{::Rails.root}/config/providers.yml")[::Rails.env]

# Initialize the Rails application.
Rails.application.initialize!
