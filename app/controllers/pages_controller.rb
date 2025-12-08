class PagesController < ApplicationController
  def home
     @products = Product.includes(:product_images).all
  end

  def support
  end
end
