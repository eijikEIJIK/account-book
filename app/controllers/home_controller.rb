class HomeController < ApplicationController
  before_action :set_category_1, only: [:new, :create, :edit, :update]
  before_action :authenticate_user,only:[:index, :new, :create, :edit, :update, :delete]
  before_action :ensure_correct_user,only:[:edit, :update, :destroy]
  def index
    @accounts=Account.where(user_id: session[:user_id]).order('date DESC')
  end

  def new

  end

  def create
    @account=Account.new(
      income_or_payment: params[:income_or_payment],
      amount: params[:amount].to_i,
      date: params[:date],
      category_1: params[:category_1],
      category_2: params[:category_2],
      memo: params[:memo], 
      user_id:session[:user_id]
    )
    if @account.save
      redirect_to('/')
    else
      flash[:notice]="保存に失敗しました"
      render('home/new')
    end
  end

  def edit
    @account=Account.find_by(id:params[:id])
  end

  def update
    @account=Account.find_by(id:params[:id])
    
    @account.income_or_payment=params[:income_or_payment]
    @account.amount=params[:amount]
    @account.date=params[:date]
    @account.category_1=params[:category_1]
    @account.category_2=params[:category_2]
    @account.memo=params[:memo]
    
    if @account.save
      redirect_to('/')
    else
      flash[:notice]="保存に失敗しました"
      render('home/edit')
    end
  end

  def destroy
    @account=Account.find_by(id:params[:id])
    @account.destroy

    redirect_to('/')
  end

  private
  def set_category_1
    @category_1=["食料品","日用品","交通費","交際費","趣味","教育","衣服","医療","通信費","光熱費","家","給料","臨時収入","その他"]
  end

  def ensure_correct_user
    @account=Account.find_by(id:params[:id])
    if @account
      if @account.user_id != session[:user_id]
        flash[:notice]="権限がありません"
      end
      redirect_to("/")
    end
  end
end
