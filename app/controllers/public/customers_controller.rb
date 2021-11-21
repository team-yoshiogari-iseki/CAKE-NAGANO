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
      flash[:notice] = "会員情報を編集しました"
      redirect_to customer_path(@customer)
    else
      render "edit"
    end
  end

  def erasure
    @customer = Customer.find(params[:id])
  end
  
  def leave
    @customer = Customer.find(current_customer.id)
    @customer.update(is_user_status: true)
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_read,:first_name_read,:postal_code,:address,:telephone_number,:email)
  end
  
end
