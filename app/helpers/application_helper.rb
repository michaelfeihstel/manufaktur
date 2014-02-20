module ApplicationHelper

	def search_stats(search_collection, model)
		s = collection.count
		m = model.all.count

		s + " gefunden."
	end

end
