class AccountsController < ApplicationController

  def index
    if current_user.role == "Admin"
      @accounts = Account.current_law_firm_accounts(current_user.law_firm_id)
    end
  end


  def show
    @account = Account.find(params[:id])
  end


  def new
    @account_types = ApplicationController::Account_types
    @account = Account.new
  end


  def edit
    @account = Account.find(params[:id])
  end


  def create
    @account_types = ApplicationController::Account_types
    @account = Account.new(params[:account])
      if @account.save
        flash[:notice] = 'Account was successfully created.'
        redirect_to(@account) 
      else
        render :action => "new" 
      end
  end

 
  def update
    @account = Account.find(params[:id])
      if @account.update_attributes(params[:account])
        flash[:notice] = 'Account was successfully updated.'
        redirect_to(@account) 
      else
        render :action => "edit" 
      end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to(accounts_url) 
  end

end
