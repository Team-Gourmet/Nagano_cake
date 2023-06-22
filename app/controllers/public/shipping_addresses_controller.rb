class Public::ShippingAddressesController < ApplicationController
  def index
    @address = ShippingAddress.new
    @addresses = ShippingAddress.all
  end
  
  def create
    @address = ShippingAddress.new(shipping_address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to shipping_addresses_path
  end

  def edit
    @address = ShippingAddress.find(params[:id])
  end
  
  def update
    @address = ShippingAddress.find(params[:id])
    @address.update(shipping_address_params)
    redirect_to shipping_addresses_path
  end
  
  def destroy
    @address = ShippingAddress.find(params[:id])
    @address.destroy
    redirect_to shipping_addresses_path
  end
  
  private
  def shipping_address_params
    params.require(:shipping_address).permit(:customer_id, :postcode, :address, :name)
  end
end
