class HearingsController < ApplicationController
 
  def index
      @hearings = Hearing.current_law_firm_hearings(current_user.law_firm_id).paginate(:page=>params[:page],:per_page=>10)
 
  end

 
  def show
    @hearing = Hearing.find(params[:id])
  end


  def new
    @hearing = Hearing.new
  end


  def edit
    @hearing = Hearing.find(params[:id])
  end


  def create
    @hearing = Hearing.new(params[:hearing])
      if @hearing.save
        flash[:notice] = 'Hearing was successfully created.'
        redirect_to(@hearing) 
      else
        render :action => "new" 
      end
  end


  def update
    @hearing = Hearing.find(params[:id])
      if @hearing.update_attributes(params[:hearing])
        flash[:notice] = 'Hearing was successfully updated.'
        redirect_to(@hearing) 
      else
        render :action => "edit" 
      end
  end


  def destroy
    @hearing = Hearing.find(params[:id])
    @hearing.destroy
    redirect_to(hearings_url) 
  end

end
