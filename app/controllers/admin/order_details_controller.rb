
      is_updated = true
        @order_detail.update(order_detail_params)
        @order.update(status: 2) if @order_detail.production_status_i18n == "manufacturing"
        # ②製作ステータスが「製作中」のときに、注文ステータスを「製作中」に更新する。
        # ここから下の内容は③の内容になります。
        # 紐付いている注文商品の製作ステータスが "すべて" [製作完了]になった際に注文ステータスを「発送準備中」に更新させたいので、
        @order_details.each do |order_detail| #　紐付いている注文商品の製作ステータスを一つ一つeach文で確認していきます。

    end

  private

  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end

end
