class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    @current_branch = Willow::StaticPage.find_by_name("Contact Us").branch
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMailer.new(@contact).deliver
      redirect_to new_contact_path, :notice => "Thank you for contacting us. We will be in touch as soon as possible."
    else
      render :action => "new"
    end
  end

end
