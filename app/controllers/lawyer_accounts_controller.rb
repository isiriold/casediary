class LawyerAccountsController < ApplicationController

  def index
    @lawyer_accounts = LawyerAccount.current_law_firm_lawyer_accounts(current_user.law_firm_id).paginate(:page=>params[:page],:per_page=>30)
  end


  def show
    @lawyer_account = LawyerAccount.find(params[:id])
  end


  def new
    @lawyer_account = LawyerAccount.new
  end


  def edit
    @lawyer_account = LawyerAccount.find(params[:id])
  end


  def create
    @lawyer_account = LawyerAccount.new(params[:lawyer_account])
      if @lawyer_account.save
        flash[:notice] = 'LawyerAccount was successfully created.'
        redirect_to(@lawyer_account) 
      else
         render :action => "new" 
      end
  end


  def update
    @lawyer_account = LawyerAccount.find(params[:id])
      if @lawyer_account.update_attributes(params[:lawyer_account])
        flash[:notice] = 'LawyerAccount was successfully updated.'
        redirect_to(@lawyer_account) 
      else
         render :action => "edit" 
      end
  end


  def destroy
    @lawyer_account = LawyerAccount.find(params[:id])
    @lawyer_account.destroy
    redirect_to(lawyer_accounts_url) 
  end


end
