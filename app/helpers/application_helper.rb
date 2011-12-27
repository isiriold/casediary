# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def change_format_to_long(object)
    date = object.nil? ? object : object.to_s(:long)
    date 
  end

  def find_user(user_id)
    user = User.find(user_id)
    user
  end

  def firm_lawyers(current_user)
    current_user.law_firm.users.map{|l| [l.name,l.id]}
  end

  def firm_lawyer_accounts(current_user)
    user_ids =LawyerAccount.find(:all,:include=>:user,:conditions=>['users.law_firm_id=?',current_user.law_firm_id]).map{|l| [l.user_id]}
    users = []
    for user_id in user_ids
      user_object =  User.find_by_id(user_id)
      users << [user_object.name,user_object.id]
    end
   return users
  end

  def firm_clients(current_user)
    current_user.law_firm.clients.map{|cl| [cl.name,cl.id]}
  end
 
  def find_client(client_id)
    Client.find(client_id).name
  end

  def split_content(content)
     length = content.length
     if length > 35
 	   text = content.slice!(0,97) 
 	   desc = text + ".." 
 	 else
 	   desc = content
      end     
  end

end
