class ContactMailer < ApplicationMailer
  default from: "zyaltu@gmail.com"   # 送信元アドレス

  def received_email(contact)
    @contact = contact
    mail(:to => "zyaltu@gmail.com", :subject => 'お問い合わせを承りました')
  end
end
