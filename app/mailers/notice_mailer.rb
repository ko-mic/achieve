class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  # 引数としてblogを追加します。
  def sendmail_blog(blog)
    @blog = blog

    mail to: ENV["GMAIL_ADRESS"],
    subject: '【Achieve】ブログが投稿されました'
  end
end
