class MessagesController < ApplicationController

  def index
    if params[:client_id].blank?
      if current_user.role=="Admin"
        @messages = Message.current_law_firm_messages(current_user.law_firm_id).paginate(:page=>params[:page],:per_page=>30)
      else
        @messages = current_user.messages.paginate(:page=>params[:page],:per_page=>30)
      end
    else
       @messages = current_user.messages.find(:all,:conditions=>['client_id=?',params[:client_id]]).paginate(params[:page] || 1, 30)
    end
  end


  def show
    @message = Message.find(params[:id])
  end


  def new
    @message = Message.new
  end


  def edit
    @message = Message.find(params[:id])
  end


  def create
    #set active resource API authentication credentials dynamically
    MessageService.user = "santhathi"
    MessageService.password = "password"
    @message = Message.new(params[:message])
    
    if params[:message][:message_body].blank? 
      flash[:notice] = "Please enter message content."
      redirect_to new_message_path(:type=>"communication")
      return nil
    end
   
   begin
      if @message.save
      client_record = Client.find(params[:message][:client_id])
        if !params[:message].nil?
   	   sms = MessageService.create(:sms => params[:message].merge!({:number => client_record.mobile_number})) 
         end 
         flash[:notice] = 'Message is sent for delivery. Please check the status after some time.'   
           redirect_to(new_message_url(:type=>"communication"))
         else  #@message.save check
           render :action => "new"
         end 
    rescue #ActiveResource::ResourceInvalid => e  
    	 flash.now[:error] = 'There seems to be a problem in sending message. Please try again.'    
    	 render :action => "new"
       end
     end


  def update
    @message = Message.find(params[:id])
      if @message.update_attributes(params[:message])
        flash[:notice] = 'Message was successfully updated.'
        redirect_to(@message)
       else
        render :action => "edit" 
      end
  end



  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirect_to(messages_url)
  end

end
