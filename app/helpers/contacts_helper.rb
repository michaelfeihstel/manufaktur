module ContactsHelper

	def get_columns(collection, group_type, grouped_by)
		group_clause = "group_by_" + "groupe_type"
		raw collection.group_by_month(grouped_by, format: "%b %Y").count.map{|k, v| k}
	end
  
end