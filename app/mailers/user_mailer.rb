class UserMailer < ApplicationMailer
    
    # -*- coding: utf-8 -*-
    require 'mail'

    Mail.defaults do
        delivery_method :smtp, {
            :address => "smtp.gmail.com",
            :port => 587,
            :domain => 'example.com',
            :user_name => 'achieverockycrag@gmail.com',
            :password => 'n9ikKL6L',
            :authentication => 'plain',
            :enable_starttls_auto => true
            
        }
    end
    
    m = Mail.new do
        from "achieverockycrag@gmail.com"
        to @inquiry.email
        subject "お問い合わせ受領メール"
        body @inquiry.message
    end
end
