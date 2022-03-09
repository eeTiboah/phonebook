class ApiController < ApplicationController

    before_action :authentication_token!

    private

    def authentication_token!
        payload = JsonWebToken.decode(auth_token)
        if payload.present?
            @current_user = Contact.find_by(name: payload["sub"])
        end

    def auth_token
        @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
    end

end