ActionMailer::Base.smtp_settings = {
    :address   => "smtp.mandrillapp.com",
    :port      => 587,
    :enable_starttls_auto => true, # detects and uses STARTTLS
    :user_name => "prashant@gyeser.com",
    :password  => "T9f0AxsTpJC5kOnI2UI8Zw",
    :authentication => 'login', # Mandrill supports 'plain' or 'login'
    :domain => 'urbanzeak.com' # your domain to identify your server when connecting
}
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_url_options[:host] = "urbanzeak.com"