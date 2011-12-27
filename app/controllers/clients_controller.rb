class ClientsController < ApplicationController
 
  def index
    search = params[:search]
    @search = Client.new_search(params[:search])
    @search.per_page = 8
    @search.conditions.law_firm_id = current_user.law_firm_id
    @search.order_by ||= "created_at"
    @search.order_as ||= "DESC"
    @clients,@clients_count  = @search.all,@search.count
    
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
    @client = Client.find(params[:id])
  end


  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end


  def create
    @client = Client.new(params[:client])
    @client.client_type = params[:client_type]
    @client.created_by = current_user.id
      if @client.save
        flash[:notice] = 'Client was successfully created.'
        redirect_to(@client) 
      else
         render :action => "new" 
      end
   end


  def update
    @client = Client.find(params[:id])
    @client.client_type = params[:client_type]
      if @client.update_attributes(params[:client])
        flash[:notice] = 'Client was successfully updated.'
        redirect_to(@client) 
      else
        render :action => "edit" 
      end
  end


  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to(clients_url) 
  end
end
