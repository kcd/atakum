class UserController < ApplicationController
  before_filter :require_login, :except => [:login, :sign_in, :logout, :google_create]

  def require_login
    redirect_to '/user/login' unless session[:user]
  end

  def login
    redirect_to '/user' if session[:user]
  end

  def sign_in
    if params[:email] or params[:password]
      flash[:error] = "Kullanici adi veya parola hatali! Lutfen tekrar deneyiniz"
    end
    redirect_to '/user/login'
  end

  def index
  end

end
