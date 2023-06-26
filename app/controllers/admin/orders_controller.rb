class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "confirmed"
      @order.order_details.each do |order_detail|
        order_detail.production_status = OrderDetail.production_status.key(1)
        order_detail.save
    end
      redirect_to admin_order_path(@order.id)
    end
  end

  private
  
  def order_params
    params.require(:order).permit(:status)
  end
end
