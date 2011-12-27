module InvoicesHelper

  def firm_income_accounts(current_user)
    Account.find(:all,:include=>:user,:conditions=>['account_type like ? and users.law_firm_id=?',"Income",current_user.law_firm_id]).map{|ac| [ac.account_name,ac.id]}
  end

  def display_payment_received(status)
    if status == true
      return "Yes"
    else
      return "No"
    end    
  end

  def admin_name(current_user)
    admin_name = User.find(:first,:conditions=>['role=? and law_firm_id=?',"Admin",current_user.law_firm_id])
  end

end
