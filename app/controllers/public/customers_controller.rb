class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "会員情報を編集しました"
      redirect_to customers_path(@customer)
    else
      render "edit"
    end
  end

  def erasure
    @customer = Customer.find(current_customer.id)
  end

  def leave
    @customer = Customer.find(current_customer.id)
    if @customer.update(is_user_status: true)
      sign_out current_customer
    end
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_read,:first_name_read,:postal_code,:address,:telephone_number,:email)
  end

end
