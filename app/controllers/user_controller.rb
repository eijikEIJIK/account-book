class UserController < ApplicationController
  #before_action:authenticate_user

  def signup
  end

  def create
    @user=User.new(
      name:params[:name],
      email:params[:email],
      password:params[:password]
    )
    if @user.save
      flash[:notice]="登録完了"
      session[:user_id]=@user.id
      redirect_to('/')
    else
      flash[:notice]="登録できませんでした"
      render('user/signup')
    end
  end

  def login_form
    
  end

  def login
    @user=User.find_by(email:params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      flash[:notice]="ログインしました"
      redirect_to("/")
    else
      flash[:notice]="ログインに失敗しました"
      render("user/login_form")
    end
  end

  def logout
    flash[:notice]="ログアウトしました"
    session[:user_id]=nil
    redirect_to("/login")
  end

end
