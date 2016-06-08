# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp 
ActionMailer::Base.smtp_settings =
{ 
:user_name => "app51414444@heroku.com", 
:password => "cjp38oj48804", 
:domain => "heroku.com", 
:address => "smtp.sendgrid.net", 
:port => 2525, 
:authentication => :plain, 
:enable_starttls_auto => true 
}
