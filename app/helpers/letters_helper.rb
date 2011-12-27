module LettersHelper

   def all_saved_letters(current_user)
     if current_user.role == "Admin"
       [['', '']] + SavedLetter.find(:all).map{|l| [l.regarding,l.id]}
     else
       [['', '']] + SavedLetter.find(:all,:conditions=>['user_id=?',current_user.id]).map{|l| [l.regarding,l.id]}
     end
   end

end
