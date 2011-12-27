class InvoicesController < ApplicationController
  
  def index
    if current_user.role == "Admin"
       @invoices = Invoice.current_law_firm_invoices(current_user.id,current_user.law_firm_id).paginate(params[:page] || 1, 30)
    else
       @invoices = Invoice.current_user_invoices(current_user.id).paginate(:page=>params[:page] || 1, :per_page=>30)
    end
  end


  def show
    @invoice = Invoice.find(params[:id])
  end


  def new
    @invoice_object = Invoice.find(:first,:order => 'invoice_number DESC')
    @invoice_no = @invoice_object.blank? ? 1 : @invoice_object.invoice_number.to_i + 1
    @invoice = Invoice.new
  end


  def edit
    @invoice = Invoice.find(params[:id])
  end


  def create
    @invoice = Invoice.new(params[:invoice])
    @invoice.payment_received = params[:payment_received]
      if @invoice.save
        flash[:notice] = 'Invoice was successfully created.'
        redirect_to(@invoice) 
      else
        render :action => "new"
      end
  end


  def update
    @invoice = Invoice.find(params[:id])
      if @invoice.update_attributes(params[:invoice])
        flash[:notice] = 'Invoice was successfully updated.'
        redirect_to(@invoice) 
       else
       render :action => "edit"
      end
  end
 
  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to(invoices_url) 
  end

  def print_invoice
    @invoice_object = Invoice.find(params[:id])
  end

  def print_receipt
    @invoice_object = Invoice.find(params[:id])
  end

end
