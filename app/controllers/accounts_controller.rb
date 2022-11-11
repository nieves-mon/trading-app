class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
    @accounts = User.where(admin:false)
  end

  def show
    @account = User.find(params[:id])
  end

  def new
    @account = User.new
  end

  def create
    @account = User.new(account_params)
    @account.skip_confirmation!
    if @account.save
      redirect_to account_path(@account), notice: "Account successfully added"
    else
      render :new
    end

  end

  def edit
    @account = User.find(params[:id])
  end

  def update
    @account = User.find(params[:id])
    @account.skip_reconfirmation!
    if @account.update(account_params)
      redirect_to account_path(@account), notice: "Account successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @account = User.find(params[:id])
    @account.destroy
    redirect_to admin_index_path, notice: "Account successfully deleted"
  end

  private

  def account_params
    params.require(:user).permit(:email,:password, :approved)
  end

end
