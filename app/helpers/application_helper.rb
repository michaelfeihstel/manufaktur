module ApplicationHelper

	def search_stats(search_collection, model)
		s = collection.count
		m = model.all.count

		s + " gefunden."
	end

	def value_or_blank(value)
	  value.blank? ? "&nbsp;".html_safe : value
	end

  def active_class(condition)
    if condition
      "active"
    end
  end

end
