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
        ConfirmMailer.sendmail_inquiry(@inquiry).deliver
        ConfirmMailer.sendselfmail_inquiry(@inquiry).deliver
    end
    
    def list
        require 'mail'
            Mail.defaults do
                retriever_method :pop3, {
                    :address => "pop.gmail.com",
                    :port => 995,
                    :user_name => 'recent:achieverockycrag@gmail.com',
                    :password => 'n9ikKL6L',
                    :enable_ssl => true
                    
                }
            end
            Mail.all  # achieverockycrag@gmail.com上のメールを受信
    end

    private
        def inquiry_params
            params.require(:inquiry) .permit(:name, :email, :phone, :message)
        end
end