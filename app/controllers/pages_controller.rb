class PagesController < ApplicationController
  def home
    @products = Product.all.order(created_at: :desc)
  end

  def support
  end
end
