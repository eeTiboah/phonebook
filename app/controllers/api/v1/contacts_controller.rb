class Api::V1::ContactsController < ApplicationController
    def index
        @contacts = Contact.all

        render json: @contacts, status: :ok
    end

    def show
        render json: Contact.find(params[:id])
    end

    def create
        @contact = Contact.new(contact_params)
        @contact.save

        render json: @contact, status: :created
    end

    def update
        @contact = Contact.where(id: params[:id]).first
        if @contact.update(contact_params)
            render json: @contact, status: :ok
        else
            head(:unprocessable_entity)
        end
    end

    def destroy
        @contact = Contact.where(id: params[:id]).first
        if @contact.destroy
            head(:ok)
        else
            head(:unprocessable_entity)
        end
    end

    private
    def contact_params
        params.require(:contact).permit(:name, :phone_number)
    end
end
