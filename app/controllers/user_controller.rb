class UserController < ApplicationController
  #include ImageHelper

  before_filter :require_login, :except => [:login, :sign_in, :sign_up, :sign_up_ok, :dynamic_districts]

  def index
  end

  def require_login
    redirect_to '/user/login' unless session[:user]
  end

  def login
    redirect_to '/user' if session[:user]
  end

  def support
  end

  def sign_in
    if session[:userinfo] = Student.authenticate(params[:email], params[:password])
      session[:user] = true
    elsif params[:email] or params[:password]
      flash[:error] = "hatali"
    end
    redirect_to '/user/login'
  end

  def logout
    reset_session
    session[:userinfo] = nil
    redirect_to '/user', :notice => "cikis basarili"
  end

  def sign_up
  end

  def sign_up_ok
    if params[:password] == params[:password2]
      user = Student.new({
        :tc => params[:tc],
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :gender => params[:gender],
        :birthday => params[:birthday],
        :email => params[:email],
        :password => params[:password],
        :phone_number => params[:phone_number],
        :city_id => params[:city_id],
        :district_id => params[:district_id],
        :address => params[:address],
        :subscriber => nil
      })

      if user.save
        if params[:image] and response = Image.upload('users', user[:id], params[:image])
          user[:image] = response[1] if response[0]
          user.save
        end
        flash[:notice] = "kayit oldu"
      else
        flash[:error] = "Kayit olmadi"
      end
      redirect_to '/'
    end
  end

  def password_ok
    if params[:new_password] != params[:new_password2]
      flash[:error] = "Yeni Parolalar Eslesmiyor"
    elsif User.authenticate(session[:userinfo][:email], params[:old_password])
      if User.update(session[:userinfo][:id], { :password => params[:new_password] }).save
        flash[:notice] = "Parolaniz Basariyla Degistirildi"
      else
        flash[:error] = "Parola Degistirilemedi"
      end
    else
      flash[:error] = "Kullanimda Olan Parolanizi Yanlis Girdiniz"
    end
    redirect_to '/user/password'
  end

    def dynamic_districts
      render :json => District.find_all_by_city_id(params[:id])
    end
end
