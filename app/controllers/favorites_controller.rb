class FavoritesController < ApplicationController
  before_action :authenticate_user!  

 
  def index
   
    @favorite_products =
    Product.joins(:favorites)
           .where(favorites: { user_id: current_user.id })
           .distinct 
  end



  def create
    product = Product.find(params[:product_id])

    favorite = Favorite.find_or_initialize_by(
      user_id: current_user.id,
      product_id: product.id
    )

    if favorite.save
      redirect_back fallback_location: favorites_path, notice: "お気に入りに追加しました。"
    else
      redirect_back fallback_location: favorites_path, alert: "お気に入りに追加できませんでした。"
    end
  end


  def destroy

    favorite = Favorite.find_by(id: params[:id], user_id: current_user.id)

    if favorite
      favorite.destroy
      redirect_back fallback_location: favorites_path, notice: "お気に入りを解除しました。"
    else
      redirect_back fallback_location: favorites_path, alert: "お気に入りが見つかりませんでした。"
    end
  end
end