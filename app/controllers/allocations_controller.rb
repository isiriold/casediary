class AllocationsController < ApplicationController

  def index
    @allocations = Allocation.current_law_firm_allocations(current_user.law_firm_id).paginate(:page=>params[:page],:per_page=>30)
  end


  def show
    @allocation = Allocation.find(params[:id])
  end


  def new
    @allocation = Allocation.new
  end


  def edit
    @allocation = Allocation.find(params[:id])
  end


  def create
    @allocation = Allocation.new(params[:allocation])
      if @allocation.save
        flash[:notice] = 'Allocation was successfully created.'
        redirect_to(@allocation) 
      else
        render :action => "new" 
      end
  end
 

  def update
    @allocation = Allocation.find(params[:id])
     if @allocation.update_attributes(params[:allocation])
        flash[:notice] = 'Allocation was successfully updated.'
        redirect_to(@allocation) 
     else
         render :action => "edit" 
       end
   end


  def destroy
    @allocation = Allocation.find(params[:id])
    @allocation.destroy
    redirect_to(allocations_url)
   end

end
