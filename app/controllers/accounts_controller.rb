class AccountsController < ApplicationController
  before_action :authorize_admin
  before_action :set_account, only: [:show, :edit, :update, :destroy,:approve]

  def index
    @accounts = User.where(admin:false)
  end

  def show
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
  end

  def update
    @account.skip_reconfirmation!
    if @account.update(account_params)
      redirect_to account_path(@account), notice: "Account successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to accounts_path, notice: "Account successfully deleted"
  end

  def pending
    @accounts = User.where(approved:false)
  end

  def approve
    @account.skip_confirmation!
    if @account.update(approved:true)
      UserMailer.with(user: @account).approved_email.deliver_later
      redirect_to account_path(@account), notice: "Account successfully approved"
    end
  end

  private

  def set_account
    @account = User.find(params[:id])
  end

  def account_params
    params.require(:user).permit(:email,:password, :approved, :password_confirmation)
  end

end
