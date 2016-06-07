class InquiryController < ApplicationController
    def index
        if params[:back]
            inquiry = params.require(:inquiry) .permit(:name, :email, :message)
            @inquiry = Inquiry.new(inquiry)
            render :action => 'index'
        else
            @inquiry = Inquiry.new
            render :action => 'index'
        end
    end

    def confirm
        inquiry = params.require(:inquiry) .permit(:name, :email, :message)
        @inquiry = Inquiry.new(inquiry)
        if @inquiry.valid?
            render :action => 'confirm'
        else
            render :action => 'index'
        end
    end

    def thanks
        inquiry = params.require(:inquiry) .permit(:name, :email, :message)
        @inquiry = Inquiry.new(inquiry)
        @inquiry.save
        render :action => 'thanks'
    end
end