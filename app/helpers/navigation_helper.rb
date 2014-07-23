module NavigationHelper
		def ensure_navigation
			@navigation ||= [ { title: "Home", url: :root } ]
		end

		def navigation_add(title, url)
			ensure_navigation << { title: title, url: url }
		end

		def render_navigation
			render "shared/navigation", nav: ensure_navigation
		end
end