class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def quit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to costomers_my_page_path(@customer)
  end
  
  def withdraw
    @customer = current_customer
    @customer.update(is_withdraw :true)
    reset_session
    redirect_to root_path
  end
  
  
  private
　def customer_params
　  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :password, :password_confirmation)
　end
end
