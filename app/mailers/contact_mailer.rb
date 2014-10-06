class ContactMailer < ActionMailer::Base
  default :from => SITE_SETTINGS["Email"]
  default :to => SITE_SETTINGS["Email"]
  
  def new(contact)
    @contact = contact
    mail :subject => "Contact form completed - #{SITE_SETTINGS['Name']}"
  end  
  
end
