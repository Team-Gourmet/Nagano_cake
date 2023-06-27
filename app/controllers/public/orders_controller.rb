class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

  def check
    @cart_items = current_customer.cart_items
    @total = 0
    if params[:order][:select_address] == "0" #ご自身の住所
      @order = Order.new(order_params)
      @order.shipping_fee = 800
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1" #登録先住所から選択
      @order = Order.new(order_params)
      @order.shipping_fee = 800
      @address = ShippingAddress.find_by(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "2" #新しいお届け先
      @order = Order.new(order_params)
      @order.shipping_fee = 800
    end

  end

  def completed

  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save!
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price_with_tax = cart_item.item.with_tax_price
      order_detail.quantity = cart_item.quantity
      order_detail.save!
    end
    @cart_items.destroy_all
    redirect_to orders_completed_path
  end

  def index
    @orders = current_customer.orders.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name, :shipping_fee, :total_amount)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :quantity, :price_with_tax)
  end
end
