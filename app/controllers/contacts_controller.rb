class ContactsController < ApplicationController
  
    def new
      @head_title = "Contact"
      @support = Contact.new(:id => 1)
    end

    def create
      @support = Contact.new(params[:contact])
      if @support.save
        redirect_to('/', :notice => "Your email was successfully sent.")
      else
        flash[:alert] = "You must fill all fields."
        render 'new'
      end
    end
  
  
  
  
end
