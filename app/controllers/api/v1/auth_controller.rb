class Api::V1::AuthController < ApiController

    skip_before_action :authentication_token!

    def create

        @contact = Contact.find_by(name: params[:name])
        p @contact
        if @contact
            render json: {
                token:  JsonWebToken.encode(sub: @contact["name"]),
                name: @contact["name"]
            }
        else
            render json: {error: ["Name not found"]}
        end

    end

    # private

    # def user_params
    #     params.require(:auth).permit(:name)
    # end

end


