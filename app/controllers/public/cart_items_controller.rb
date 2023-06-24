class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create

    @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])   #カート内に入っている商品ＩＤと同じＩＤを商品一覧から探す
    if @cart_item.present?
       @cart_item.quantity = @cart_item.quantity + params[:cart_item][:quantuty].to_i  #元々入っている個数＋商品から追加された個数
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
    end
    @cart_item.save
    redirect_to cart_items_path
  end



  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
  end
end
