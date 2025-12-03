class ProductsController < ApplicationController
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
end
