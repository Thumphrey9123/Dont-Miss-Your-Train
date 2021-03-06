class UsersController < ApplicationController
    before_action :authorized, except: [:new, :create]

    def new
        @user = User.new
        @errors = flash[:errors]
    end

    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            session[:user_id] = user.id
            redirect_to home_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def home
        @user = current_user
        @favorites = @user.favorites
        @stations = @user.stations.sort
    end

    def edit
        @user = User.find(session[:user_id])
        @errors = flash[:errors]
    end

    def update
        user = User.find(session[:user_id])
        if user.valid?
            user.update(user_params)
            redirect_to home_path
        else
            flash[:errors] = user.errors.full_messages
            redirect_to edit_user_path
        end
    end
    
    
    private
    def user_params
        params.require(:user).permit(:user_name, :password, :email)
    end
end
