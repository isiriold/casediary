class LawFirmsController < ApplicationController
  skip_before_filter :check_logged_in,:only=>[:new,:create]

  def index
    @law_firms = LawFirm.all
  end


  def show
    @law_firm = LawFirm.find(params[:id])
    @user = User.find_by_law_firm_id(params[:id])
  end


  def new
    @law_firm = LawFirm.new
    @user = User.new
  end


  def edit
    @law_firm = LawFirm.find(params[:id])
  end

  def create
    @law_firm = LawFirm.new(params[:law_firm])
    @user = User.new(params[:user])
    @user.role = "Admin"
      if @law_firm.save
         @user.law_firm_id = @law_firm.id
         @user.save
        flash[:notice] = 'LawFirm was successfully created.'
        redirect_to(@law_firm) 
      else
        render :action => "new" 
      end
  end


  def update
    @law_firm = LawFirm.find(params[:id])
      if @law_firm.update_attributes(params[:law_firm])
        flash[:notice] = 'LawFirm was successfully updated.'
        redirect_to(@law_firm) 
      else
        render :action => "edit" 
      end
  end


  def destroy
    @law_firm = LawFirm.find(params[:id])
    @law_firm.destroy
    redirect_to(law_firms_url) 
  end

 
end
