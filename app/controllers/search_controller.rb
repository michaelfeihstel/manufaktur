class SearchController < ApplicationController
  def index
    @results = PgSearch.multisearch(params[:term])
      .includes(:searchable)
      .reorder("CASE searchable_type WHEN 'Contact' THEN 1 WHEN 'Product' THEN 2 WHEN 'Material' THEN 3 WHEN 'Series' THEN 4 WHEN 'Letter' THEN 5 ELSE 6 END, searchable_id DESC")
  end
end