module ClientsHelper
   
  def all_referers
    Referer.find(:all).map{|r| [r.name,r.id]}
  end

end
