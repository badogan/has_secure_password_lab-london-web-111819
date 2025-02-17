class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        return redirect_to login_form_path unless user
        session[:user_id] = user.id
        @user = user
        # redirect_to controller: 'welcome', action: 'home'
        redirect_to '/'
    end

    def destroy
        # session.delete :name
        session.destroy
        redirect_to '/'
    end

end