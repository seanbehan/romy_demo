class AuthController < ApplicationController
  skip_before_action :require_current_user
  def login
    return unless request.post?
    @user = User.where(email:params[:user][:email]).first
    if @user && @user.check_password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to after_login_or_signup_path
    else
      @errors = ["Unable to login with that email/password combo"]
    end
  end

  def join
    return unless request.post?

    @user = User.new(params_for(User))
    if @user.save
      session[:user_id] = @user.id
      redirect_to after_login_or_signup_path
    else
      @errors = @user.errors.full_messages
    end
  end

  def logout
    session.clear
    flash[:message] = "Thanks for visiting!"
    redirect_to login_path
  end

  private

  def after_login_or_signup_path
    transactions_path
  end
end
