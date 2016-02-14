class NoticeMailer < ApplicationMailer

  default from: 'iwasaki_d@iwasaki.blog.com',
          subject: '新しいコメントが投稿されました'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(comment)
    @comment = comment


    mail(
        to: "d.iwasaki.g@gmail.com"
    ) do |format|
      format.text
    end

  end
end
