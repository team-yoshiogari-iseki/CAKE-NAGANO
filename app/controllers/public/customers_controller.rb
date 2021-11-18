class Public::CustomersController < ApplicationController

  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render "edit"
    end
  end
    
  def erasure
    @customer = Customer.find(params[:id])
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_read,:first_name_read,:postal_code,:address,:telephone_number,:email)
  end
  
  
  

end
