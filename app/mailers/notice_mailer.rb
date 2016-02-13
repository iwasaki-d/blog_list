class NoticeMailer < ApplicationMailer

  default from: 'from@blog_list.mail',
          subject: '新しいコメントが投稿されました'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail_confirm(comment)
    @comment = comment


    mail(
        to: "to@blog_list.mail"
    ) do |format|
      format.text
    end

  end
end
