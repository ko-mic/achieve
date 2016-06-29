class ConfirmMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.sendmail_inquiry.subject
  #
  # 引数としてinquiryを追加します。

  def sendselfmail_inquiry(inquiry)
    @inquiry = inquiry

    mail to: inquiry.email,
    subject: "お問い合わせを受信しました。",
    content_transfer_encoding: '8bit'
  end


  def sendmail_inquiry(inquiry)
    @inquiry = inquiry
    
    mail to: ENV["GMAIL_ADRESS"],
    subject: "お問い合わせを受信しました。",
    content_transfer_encoding: '8bit'
  end
end
