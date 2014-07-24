module NavigationHelper
	def build_breadcrumbs(crumbs)
		crumbs.each do |crumb|
			content_tag :li do
				link_to crumb[:title], crumb[:url]
			end
		end
	end
end