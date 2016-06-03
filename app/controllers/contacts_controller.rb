class ContactsController < ApplicationController
    def index
        @contacts = Contact.new
        render :action => 'index' 
    end
end
