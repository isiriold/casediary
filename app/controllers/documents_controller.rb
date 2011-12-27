class DocumentsController < ApplicationController

  def index
    @documents = Document.all
  end

 
  def show
    @document = Document.find(params[:id])
  end

 
  def new
    @document = Document.new
  end


  def edit
    @document = Document.find(params[:id])
  end


  def create
    @document = Document.new(params[:document])
    @document.status = params[:status]
      if @document.save
        flash[:notice] = 'Document was successfully created.'
        redirect_to(case_path(params[:document][:case_id])) 
      else
        render :action => "new" 
      end
  end


  def update
    @document = Document.find(params[:id])
      if @document.update_attributes(params[:document])
        flash[:notice] = 'Document was successfully updated.'
        redirect_to(@document) 
      else
        render :action => "edit" 
      end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to(documents_url) 
  end

end
