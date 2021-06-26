class ContactMailer < ApplicationMailer
  default from: ENV['SEND_MAIL']   # 送信元アドレス

  def received_email(contact)
    @contact = contact
    mail(:to => ENV['SEND_MAIL'], :subject => 'お問い合わせを承りました')
  end
end
