class InquiryController < ApplicationController
    def index
        if params[:back]
            @inquiry = Inquiry.new(inquiry_params)
            render :action => 'index'
        else
            @inquiry = Inquiry.new
            render :action => 'index'
        end
    end

    def confirm
        @inquiry = Inquiry.new(inquiry_params)
        if @inquiry.valid?
            render :action => 'confirm'
        else
            render :action => 'index'
        end
    end

    def thanks
        @inquiry = Inquiry.create(inquiry_params)
        render :action => 'thanks'
        ConfirmMailer.sendselfmail_inquiry(@inquiry).deliver
        ConfirmMailer.sendmail_inquiry(@inquiry).deliver
    end
    
    def list
        require 'mail'
            Mail.defaults do
                retriever_method :pop3, {
                    :address => "pop.gmail.com",
                    :port => 995,
                    :user_name => ENV["GMAIL_SENDADRESS"],
                    :password => ENV["GMAIL_PASSWORD"],
                    :enable_ssl => true
                }
            end
            @mail = Mail.find(:what => :last, :count => 3, :order => :desc)
    end

    private
        def inquiry_params
            params.require(:inquiry) .permit(:name, :email, :phone, :message)
        end
end