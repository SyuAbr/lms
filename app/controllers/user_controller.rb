class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    result = UserCreationJob.perform_now(user_params)
    if result[:success]
      session[:user_id] = result[:user_id]
      redirect_to mermaid_path, notice: 'Успешный вход в систему!'
    else
      flash[:error] = result[:errors].join(", ")
      redirect_to login_path
    end
  end

  def login_form
    @user = User.new
  end

  def login
    if params[:email].present?
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to mermaid_path , notice: "Успешный вход в систему!"
      else
        flash.now[:alert] = "Неверный логин или пароль"
        redirect_to root_path
      end
    else
      flash.now[:alert] = "Введите адрес электронной почты"
      redirect_to :login
    end
  end
  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :surname, :name, :middle_name)
  end
end
