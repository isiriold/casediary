class LettersController < ApplicationController

  def index
   if params[:client_id].blank?
     if current_user.role=="Admin"
        @letters = Letter.current_law_firm_letters(current_user.law_firm_id).paginate(:page=>params[:page] || 1, :per_page=>30)
     else
         @letters = current_user.letters.paginate(:page=>params[:page] || 1, :per_page=>30)
     end
   else  
       @letters = current_user.letters.find(:all,:conditions=>['client_id=?',params[:client_id]]).paginate(params[:page] || 1, 30)
   end
  end
 

  def show
    @letter = Letter.find(params[:id])
  end


  def new
    @letter = Letter.new
  end


  def edit
    @letter = Letter.find(params[:id])
  end


  def create
    @letter = Letter.new(params[:letter])
      if @letter.save
        flash[:notice] = 'Letter was successfully created.'
        redirect_to(print_letter_path(@letter,:client_id=>params[:letter][:client_id])) 
      else
        render :action => "new" 
      end
  end


  def update
    @letter = Letter.find(params[:id])
      if @letter.update_attributes(params[:letter])
        flash[:notice] = 'Letter was successfully updated.'
        redirect_to(@letter) 
      else
        render :action => "edit" 
      end
  end


  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy
    redirect_to(letters_url) 
  end

  def print
    @letter = Letter.find(params[:id])
    @client = Client.find(params[:client_id])
    respond_to do |format|
    format.pdf  {
       options = { :left_margin => 30, :right_margin => 30, :top_margin => 20, :bottom_margin => 20, :page_size => 'A4'}
       prawnto :inline => false, :prawn => options, :filename => "#{@letter.regarding}.pdf"
       render :layout => false}
      end
  end   
  
   def render_saved_letters
    @saved_letter = SavedLetter.find(params[:letter_id])
    render :update do |page|
       page << "jQuery('#letter_regarding').val('#{@saved_letter.regarding}')"
       page << "jQuery('#letter_content').val('#{@saved_letter.content}')"
    end
  end
  
end
