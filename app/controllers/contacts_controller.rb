class ContactsController < ApplicationController
    
    def new
        @contact = Contact.new(contact_params)
    end
    
    def create
        if @contact.save
            flash[:success] = 'Message sent.'
            redirect_to new_contact_path
        else
            flash[:error] = 'An error occurred. Message not sent.'
            redirect_to new_contact_path
        end
    end
    
    private
    def contact_params
        params.require(:contact).permit(:name, :email, :comments)
    end
    
end