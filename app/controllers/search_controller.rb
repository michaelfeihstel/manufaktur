class SearchController < ApplicationController
  def index
    @results = PgSearch.multisearch(params[:term]).includes(:searchable)
  end
end