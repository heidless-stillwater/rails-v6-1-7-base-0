class ApplicationMailer < ActionMailer::Base
  default :from => Rails.application.credentials.sendgrid_mailer[:mail_sender]
  layout 'mailer'

end
