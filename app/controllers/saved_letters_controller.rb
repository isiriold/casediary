class SavedLettersController < ApplicationController

  def index
    if current_user.role == "Admin"
      @saved_letters = SavedLetter.current_law_firm_saved_letters(current_user.law_firm_id)
    else
      @saved_letters = current_user.saved_letters
    end
  end


  def show
    @saved_letter = SavedLetter.find(params[:id])
  end


  def new
    @saved_letter = SavedLetter.new
  end


  def edit
    @saved_letter = SavedLetter.find(params[:id])
  end


  def create
    @saved_letter = SavedLetter.new(params[:saved_letter])
      if @saved_letter.save
        flash[:notice] = 'SavedLetter was successfully created.'
        redirect_to(@saved_letter) 
      else
        render :action => "new" 
      end
  end


  def update
    @saved_letter = SavedLetter.find(params[:id])
      if @saved_letter.update_attributes(params[:saved_letter])
        flash[:notice] = 'SavedLetter was successfully updated.'
        redirect_to(@saved_letter) 
      else
         render :action => "edit" 
      end
  end

  def destroy
    @saved_letter = SavedLetter.find(params[:id])
    @saved_letter.destroy
    redirect_to(saved_letters_url) 
  end

 
end
