class InquiryController < ApplicationController
    def index
        if params[:back]
            @inquiry = Inquiry.new(inquiry)
            render :action => 'index'
        else
            @inquiry = Inquiry.new
            render :action => 'index'
        end
    end

    def confirm
        @inquiry = Inquiry.new(inquiry)
        if @inquiry.valid?
            render :action => 'confirm'
        else
            render :action => 'index'
        end
    end

    def thanks
        @inquiry = Inquiry.create(inquiry)
        render :action => 'thanks'
    end

    private
        def inquiry
            params.require(:inquiry) .permit(:name, :email, :phone, :message)
        end
end