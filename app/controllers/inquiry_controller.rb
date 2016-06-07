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
    end

    private
        def inquiry_params
            params.require(:inquiry) .permit(:name, :email, :phone, :message)
        end
end