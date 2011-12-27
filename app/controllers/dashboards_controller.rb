class DashboardsController < ApplicationController
  
  def index
    @hearings_of_today = current_user.hearings.find(:all,:conditions=>['hearing_date=?',Date.today])
    @hearings_of_tomorrow = current_user.hearings.find(:all,:conditions=>['hearing_date=?',Date.today.advance(:days=>1)])
    @cases = Case.find(:all,:include=>:user,:conditions=>['status like ? and users.law_firm_id=?',"pending",current_user.law_firm_id])
    @my_alerts = current_user.alerts.find(:all,:conditions=>['display_till>=?',Date.today])
    @alerts = Alert.find(:all,:include=>:user,:conditions=>['display_status=? and display_till>=? and users.law_firm_id=?',true,Date.today,current_user.law_firm_id])
  end

end
