class Api::V1::ContactsController < ApiController

    
    def index
        @contacts = Contact.all

        render json: @contacts, status: :ok
    end

    def show
        @contact = Contact.find(params[:id])
        if @contact
            render json: @contact, status: :ok
        else
            head(:unprocessable_entity)
        end
    end

    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            render json: @contact, status: :created
        else
            render json: @contact.errors, status: :unprocessable_entity
        end

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
        Contact.find(params[:id]).destroy!
        
        head(:no_content)
        
        
    end

    private
    def contact_params
        params.require(:contact).permit(:name, :phone_number)
    end
end
