class Admin::OrderDetailsController < ApplicationController
    def update
      @order_detail = OrderDetail.find(params[:id])
      @order = @order_detail.order
      @order_details = @order.order_details
  
      is_updated = true
        if  @order_detail.update(order_detail_params)
            @order.update(status: 2) if @order_detail.production_status == "manufacturing"
            @order_details.each do |order_detail| #　紐付いている注文商品の製作ステータスを一つ一つeach文で確認していきます。
          if order_detail.production_status != "finish" # 製作ステータスが「製作完了」ではない場合
            is_updated = false 
          end
          end
        @order.update(status: 3) if is_updated
        # is_updatedがtrueの場合に、注文ステータスが「発送準備中」に更新されます。上記のif文でis_updatedがfalseになっている場合、更新されません。
        end
        redirect_to admin_order_path(@order.id)
        
    end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
