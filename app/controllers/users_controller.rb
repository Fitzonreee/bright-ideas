class UsersController < ApplicationController

  def create
    user = User.create(user_params)
    if user.errors.any?
      flash[:reg_errors] = user.errors.full_messages
      redirect_to '/'
    else
      flash[:success] = ["Registration successful. Please login."]
      redirect_to root_path
    end
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to '/bright_ideas'
    else
      flash[:errors] = ["Invalid email or password"]
      redirect_to root_path
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :alias, :password)
  end

end
