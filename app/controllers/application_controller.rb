# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout "application"
  helper :all # include all helpers, all the time
  before_filter :check_logged_in
 
  protect_from_forgery
  Our_client = [['Petitioner','petitioner'],['Respondent','Respondent'],['Appalent','Appalent']]
  Account_types = [['Income','Income'],['Expense','Expense']]
  Case_types = [['AC (Arbitration Case)','AC (Arbitration Case)'],['CA (Company Application Matte)','CA (Company Application Matte)'],['CCC (Civil Contempt Petition)','CCC (Civil Contempt Petition)'],['CEA (Central Excise Appeal)','CEA (Central Excise Appeal)'],['CMP (Civil Misc Petition)','CMP (Civil Misc Petition)'],['COA (U/S 10(F) Of The Companie)','COA (U/S 10(F) Of The Companie)'],['COMPA (Company Appeal)','COMPA (Company Appeal)'],['COP (Company Petition)','COP (Company Petition)'],['CP (Civil Petition)','CP (Civil Petition)'],['CP.KLRA (Cp On Karnataka Land Refo)','CP.KLRA (Cp On Karnataka Land Refo)'],['CRA (Cross Appeals)','CRA (Cross Appeals)'],['CRC (Civil Referred Case)','CRC (Civil Referred Case)'],['CRL.A (Criminal Appeal)','CRL.A (Criminal Appeal)'],['CRL.CCC (Criminal Contempt Petitio)','CRL.CCC (Criminal Contempt Petitio)'],['CRL.P (Criminal Petition)','CRL.P (Criminal Petition)'],['CRL.RC (Criminal Referred Case)','CRL.RC (Criminal Referred Case)'],['CRL.RP (Criminal Revision Petitio)','CRL.RP (Criminal Revision Petitio)'],['CROB (Cross Objection)','CROB (Cross Objection)'],['CRP (Civil Revision Petition)','CRP (Civil Revision Petition)'],['CSTA (Customs Appeal)','CSTA (Customs Appeal)'],['EP (Election Petition)','EP (Election Petition)'],['EX.FA (Execution First Appeal)','EX.FA (Execution First Appeal)'],['GTA (Gift Tax Appeal)','GTA (Gift Tax Appeal)'],['HRRP (House Rent Rev. Petition)','HRRP (House Rent Rev. Petition)'],['ITA (Income Tax Appeal)','ITA (Income Tax Appeal)'],['ITA.CROB (I.T Appeal Cross Objectio)','ITA.CROB (I.T Appeal Cross Objectio)'],['ITRC (Income-Tax Referred Case)','ITRC (Income-Tax Referred Case)'],['LRRP (Land Reforms Revision Pet)','LRRP (Land Reforms Revision Pet)'],['LTRP (Luxury Tax Revision Petn.)','LTRP (Luxury Tax Revision Petn.)'],['MFA (Miscl. First Appeal)','MFA (Miscl. First Appeal)'],['MFA.CROB (Mfa Cross Obj)','MFA.CROB (Mfa Cross Obj)'],['MISC.CRL (Miscellaneous Case For Cr)','MISC.CRL (Miscellaneous Case For Cr)'],['MISC.CVL (Miscellaneous Case For Ci)','MISC.CVL (Miscellaneous Case For Ci)'],['MISC.P (Misc Petition)','MISC.P (Misc Petition)'],['MISC.W (Miscellaneous Case For Wr)','MISC.W (Miscellaneous Case For Wr)'],['MSA (Miscl Second Appeal)','MSA (Miscl Second Appeal)'],['MSA.CROB (Msa Cross Obj)','MSA.CROB (Msa Cross Obj)'],['OLR (Official Liquid Report)','OLR (Official Liquid Report)'],['OS (Original Suit)','OS (Original Suit)'],['OSA (Original Side Appeal)','OSA (Original Side Appeal)'],['OSA.CROB (Osa Cross Objection)','OSA.CROB (Osa Cross Objection)'],['PROB.CP (Probate Civil Petition)','PROB.CP (Probate Civil Petition)'],['RFA (Regular First Appeal)','RFA (Regular First Appeal)'],['RFA.CROB (Rfa Cross Obj)','RFA.CROB (Rfa Cross Obj)'],['RP (Review Petition)','RP (Review Petition)'],['RPFC (Rev.Pet Family Court)','RPFC (Rev.Pet Family Court)'],['RSA (Regular Second Appeal)','RSA (Regular Second Appeal)'],['RSA.CROB (Rsa Cross Obj)','RSA.CROB (Rsa Cross Obj)'],['SCLAP (Supreme Court Leave Appli)','SCLAP (Supreme Court Leave Appli)'],['STA (Sales Tax Appeal)','STA (Sales Tax Appeal)'],['STRP (Sale Tax Revision Petitio)','STRP (Sale Tax Revision Petitio)'],['TAET (Tax Appeal On Entry Tax)','TAET (Tax Appeal On Entry Tax)'],['TOS (Testamentory Original Sui)','TOS (Testamentory Original Sui)'],['TRC (Tax Referred Cases)','TRC (Tax Referred Cases)'],['WA (Writ Appeal)','WA (Writ Appeal)'],['WA.CROB (Wa Cross Objection)','WA.CROB (Wa Cross Objection)'],['WP (Writ Petition)','WP (Writ Petition)'],['WPCP (Civil Pet In Writ Side )','WPCP (Civil Pet In Writ Side )'],['WPHC (Habeas Corpus)','WPHC (Habeas Corpus)'],['WTA (Wealth Tax Appeal)','WTA (Wealth Tax Appeal)']]
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  helper_method :current_user
  
  def check_logged_in
    unless current_user.blank?
      return 
    else  
      redirect_to '/login'
     end  
   end


  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end
