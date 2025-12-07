class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
  end

  def shirts
    @products = Product.where(category: "shirt")
  end

  def sneakers
    @products = Product.where(category: "sneaker")
  end

  def sweats
    @products = Product.where(category: "sweat")
  end

  def afters
    @products = Product.where(category: "after")
  end

  def pants
    @products = Product.where(category: "pants")
  end

 
  def search
    @query = params[:q].to_s.strip

    if @query.present?
      @products = Product.where(
        "name ILIKE :q OR category ILIKE :q OR description ILIKE :q",
        q: "%#{@query}%"
      )
    else
      @products = Product.none
    end
  end


  def show
    
    @product = Product.find(params[:id])

    
    @product_images = @product.product_images.order(:position)

    
    if @product_images.blank? && @product.image_url.present?
      @product_images = [
        OpenStruct.new(image_url: @product.image_url)
      ]
    end

 
    @favorited = user_signed_in? && current_user.favorites.exists?(product_id: @product.id)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end