class CasesController < ApplicationController
  layout 'application',:except=>[:edit_status]
  $our_client= ApplicationController::Our_client
  $case_types= ApplicationController::Case_types

  def index
    search = params[:search]
    @search = Case.new_search(params[:search])
    @search.per_page = 30
    @search.conditions.user.law_firm_id = current_user.law_firm_id
    @search.order_by ||= "created_at"
    @search.order_as ||= "DESC"
    @cases,@cases_count  = @search.all,@search.count
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clients }
      format.js  {
                    render :update do |page|
                      page.replace_html 'search_result',:partial=>'search_result'
                    end  
                  } 
                     
    end   
  end

  
  def show
    @case = Case.find(params[:id])
    @documents = @case.documents
  end

 
  def new
    @case = Case.new
  end


  def edit
    @case = Case.find(params[:id])
  end


  def create
    @case = Case.new(params[:case])
    @case.status = "pending"
      if @case.save
        flash[:notice] = 'Case was successfully created.'
        redirect_to(@case) 
      else
        render :action => "new" 
      end
  end
 

  def update
    @case = Case.find(params[:id])
      if @case.update_attributes(params[:case])
        flash[:notice] = 'Case was successfully updated.'
        redirect_to(@case)
      else
        render :action => "edit" 
      end
  end


  def destroy
    @case = Case.find(params[:id])
    @case.destroy
    redirect_to(cases_url) 
  end
  
  def edit_status
    @case_obj = Case.find(params[:id])
  end

  def update_status
    case_obj = Case.find(params[:id])
    case_obj.update_attributes(params[:case])
    case_obj.change_status(params[:status])
    redirect_to case_path(params[:id]) 
  end


 
end
