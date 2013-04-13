class UserController < ApplicationController
  def index
  end

  def login
    redirect_to '/user' if session[:user]
  end

  def sign_in
    if session[:userinfo] = User.authenticate(params[:email], params[:password])
      session[:user] = true
    elsif params[:email] or params[:password]
      flash[:error] = "Kullanıcı adı veya parola hatalı! Lütfen tekrar deneyiniz"
    end
    redirect_to '/user/login'
  end

end
