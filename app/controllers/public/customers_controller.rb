class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def quit
  end
  
  def update
  end
  
  def withdraw
  end
  
  
  private
　def customer_params
　  params_require(:customer).parmit(:last_name, :first_name,:last_name_kana, :first_name_kana,:email,:postcode,:address,:phone_number, :password,:password_confirmation)
　end
end
