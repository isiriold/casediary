class CommunicationsController < ApplicationController
  
  def index
    if current_user.role=="Admin"
      @letters = Letter.all(:include=>[:user],:conditions=>['user_id=? and users.law_firm_id=?',current_user.id,current_user.law_firm_id])
    else
     @letters = Letter.all(:conditions=>['user_id=?',current_user.id])
    end
  end

end
