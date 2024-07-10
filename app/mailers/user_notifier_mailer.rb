class UserNotifierMailer < ApplicationMailer
  class UserNotifierMailer < ApplicationMailer
    default :from => Rails.application.credentials.sendgrid_mailer[:mail_sender]
  
    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_signup_email(user)
      console.log('##################### send_signup_email #############################')
      @user = user
      mail( :to => @user.email,
      :subject => 'Thanks for signing up for our amazing app' )
    end
  end  
end

