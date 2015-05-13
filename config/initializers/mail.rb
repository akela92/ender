ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.mandrillapp.com',
    :port           => '587',
    :authentication => :login,
    :user_name      => 'irrigona@hotmail.com',
    :password       => 'nzu9PD2IZFC4jee-FumH6A',
    :enable_starttls_auto => true
  }

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: 'utf-8'
