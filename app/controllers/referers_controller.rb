class ReferersController < ApplicationController
  layout 'application',:except=>[:new]

  def index
    @referers = Referer.all
  end


  def show
    @referer = Referer.find(params[:id])
  end


  def new
    @referer = Referer.new
  end


  def edit
    @referer = Referer.find(params[:id])
  end


  def create
    @referer = Referer.new(params[:referer])
    if @referer.save
        redirect_to new_client_path
    end
  end


  def update
    @referer = Referer.find(params[:id])
      if @referer.update_attributes(params[:referer])
        flash[:notice] = 'Referer was successfully updated.'
        redirect_to(@referer) 
      else
        render :action => "edit" 
      end
  end


  def destroy
    @referer = Referer.find(params[:id])
    @referer.destroy
    redirect_to(referers_url) 
  end

end
