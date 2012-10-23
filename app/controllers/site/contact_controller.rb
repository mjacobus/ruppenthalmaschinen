class Site::ContactController < SiteController
  respond_to :html, :js
  
  def new
    @contact = Contact.new
    respond_with(@contact)
  end
  
  def create
    @contact = Contact.new(params[:contact])
    
    if @contact.save
      # send an email
      
      unless request.xhr?
        flash[:notice] = t('messages.contact.success')
      end
    end
    
    respond_with(@contact, :location => contacts_path)
  end
end
