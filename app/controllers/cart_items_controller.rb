class CartItemsController < ApplicationController
 before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])

    cart_item = current_user.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity ||= 0
    cart_item.quantity += 1

    if cart_item.save
      redirect_back fallback_location: root_path, notice: "カートに商品を追加しました。"
    else
      redirect_back fallback_location: root_path, alert: "カートに追加できませんでした。"
    end
  end

  def update
    cart_item = current_user.cart_items.find(params[:id])
    quantity = params[:cart_item][:quantity].to_i

    if quantity <= 0
      cart_item.destroy
      redirect_to cart_path, notice: "カートから商品を削除しました。"
    else
      if cart_item.update(quantity: quantity)
        redirect_to cart_path, notice: "数量を更新しました。"
      else
        redirect_to cart_path, alert: "数量を更新できませんでした。"
      end
    end
  end

  def destroy
    cart_item = current_user.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: "カートから商品を削除しました。"
  end
end
