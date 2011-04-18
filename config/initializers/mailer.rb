# config/initializers/mailer.rb
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
:enable_starttls_auto => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => "sambragg.co.uk",
:user_name => 'mike.a.bragg@gmail.com',
:password => 'audiorag1',
:authentication => 'plain',
}
