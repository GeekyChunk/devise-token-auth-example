class MainController < ApplicationController
    before_action :authenticate_user!

    def me
        render json: { user: current_user }
    end

    def upme
        user = User.find(current_user.id)
        params = upme_params
        user.bio = params[:bio]
        if user.save
            render json: user
        else
            head :unproccessable_entity
        end
    end

    private
    def upme_params
        params.require(:profile).permit(:bio)
    end
end