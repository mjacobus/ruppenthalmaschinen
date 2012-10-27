class AppMailer < ActionMailer::Base
  def contact_email(contact)
    @contact = contact
    mail(
      :to => 'contato@ruppenthalmaschinen.com.br',
      :from => contact.email,
      :reply_to => contact.email,
      :subject => contact.subject)
  end
end
