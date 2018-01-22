class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin && admin.authenticate(params[:session][:password])
      log_in admin
      redirect_to root_url
    else
      flash.now[:danger] = '用户名或密码错误'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_url
  end
end
