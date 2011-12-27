class AlertsController < ApplicationController

  def index
    @alerts = Alert.all
  end

 
  def show
    @alert = Alert.find(params[:id])
  end

  
  def new
    @alert = Alert.new
  end

 
  def edit
    @alert = Alert.find(params[:id])
  end

 
  def create
    @alert = Alert.new(params[:alert])
    @alert.display_status = params[:display_status]
      if @alert.save
        flash[:notice] = 'Alert was successfully created.'
        redirect_to(@alert) 
      else
        render :action => "new"
      end
  end
 
 
  def update
    @alert = Alert.find(params[:id])
    @alert.display_status = params[:display_status]
      if @alert.update_attributes(params[:alert])
        flash[:notice] = 'Alert was successfully updated.'
        redirect_to(@alert) 
      else
        render :action => "edit" 
      end
  end

  def destroy
    @alert = Alert.find(params[:id])
    @alert.destroy
    redirect_to(alerts_url)
  end
end
