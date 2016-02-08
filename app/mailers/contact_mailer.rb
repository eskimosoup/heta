class ContactMailer < ActionMailer::Base
  default :from => SITE_SETTINGS["Email"]
  #default :to => SITE_SETTINGS["Email"]

  def new(contact)
    @contact = contact
    case @contact.form_type
    when 'course_instance_enquiry'
      mail to: SITE_SETTINGS['Course Instance Enquiry'], subject: @contact.subject
    else
      mail to: SITE_SETTINGS["Email"], subject: "Contact form completed - #{SITE_SETTINGS['Name']}"
    end
  end

end
