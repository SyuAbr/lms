class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to graph_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to login_path
    end
  end

  def login_form
    @user = User.new
  end

  def login
    if params[:email].present?
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to graph_path, notice: "Успешный вход в систему!"
      else
        flash.now[:alert] = "Неверный логин или пароль"
        render 'page/start'
      end
    else
      flash.now[:alert] = "Введите адрес электронной почты"
      render 'page/start'
    end
  end
  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: "Successfully logged out!"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :surname, :name, :middle_name)
  end
end
