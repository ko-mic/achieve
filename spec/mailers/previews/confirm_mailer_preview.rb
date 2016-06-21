# Preview all emails at http://localhost:3000/rails/mailers/confirm_mailer
class ConfirmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/confirm_mailer/sendmail_inquiry
  def sendmail_inquiry
    ConfirmMailer.sendmail_inquiry
  end

end
