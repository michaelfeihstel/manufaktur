class SearchController < ApplicationController
  def search
    term = params([:term])
    @products = Product.where("name LIKE ?", term)
  end
end