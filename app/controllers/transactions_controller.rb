class TransactionsController < ApplicationController

  def index
    if current_user.role == "Admin"
      @transactions = Transaction.current_law_firm_transactions(current_user.law_firm_id).paginate(:page=>params[:page] || 1, :per_page=>30)
    else
      @transactions = Transaction.current_user_transactions(current_user).paginate(:page=>params[:page] || 1, :per_page=>30)
    end
  end


  def show
    @transaction = Transaction.find(params[:id])
  end


  def new
    @transaction = Transaction.new
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end


  def create
    @transaction = Transaction.new(params[:transaction])
      if @transaction.save
        ClientTransaction.create_row(params[:client_id],@transaction.id)
        flash[:notice] = 'Transaction was successfully created.'
        redirect_to(@transaction)
      else
         render :action => "new" 
      end
   end


  def update
    @transaction = Transaction.find(params[:id])
     if @transaction.update_attributes(params[:transaction])
        flash[:notice] = 'Transaction was successfully updated.'
        redirect_to(@transaction)
     else
        render :action => "edit"
     end
  end


  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to(transactions_url)
  end

end
