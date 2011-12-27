class EmailsController < ApplicationController

  def index
    if params[:client_id].blank?
      if current_user.role=="Admin"
        @emails = Email.current_law_firm_emails(current_user.law_firm_id).paginate(:page=>params[:page],:per_page=>30)
      else
        @emails = current_user.emails.paginate(:page=>params[:page],:per_page=>30)
      end
    else
       @emails = current_user.emails.find(:all,:conditions=>['client_id=?',params[:client_id]]).paginate(params[:page] || 1, 30)
    end
  end


  def show
    @email = Email.find(params[:id])
  end


  def new
    @email = Email.new
  end


  def edit
    @email = Email.find(params[:id])
  end


  def create
    @email = Email.new(params[:email])
    client_obj = Client.find(params[:email][:client_id])
      if @email.save
        Notifier.deliver_email_notification(@email,current_user,client_obj)
        flash[:notice] = 'Email was successfully created.'
        redirect_to(@email) 
      else
        render :action => "new" 
      end
  end


  def update
    @email = Email.find(params[:id])
      if @email.update_attributes(params[:email])
        flash[:notice] = 'Email was successfully updated.'
        redirect_to(@email) 
      else
        render :action => "edit" 
      end
  end


  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to(emails_url) 
  end

end
