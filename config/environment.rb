# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => Rails.application.credentials.sendgrid_mailer[:user_name],
  :password => Rails.application.credentials.sendgrid_mailer[:api_key_secret], # secret sendgrid API key
  :domain => Rails.application.credentials.sendgrid_mailer[:domain],
  :address => 'smtp.sendgrid.net',
  :port => 587,   # 465	(for SSL connections). 25, 587	(for unencrypted/TLS connections)
  :authentication => :plain,
  :enable_starttls_auto => true
}
