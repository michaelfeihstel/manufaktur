module UiHelper

	def flash_class(type)
		case type
			when :notice then "alert-box info"
			when :success then "alert-box success"
			when :alert then "alert-box error"
		end
	end

end