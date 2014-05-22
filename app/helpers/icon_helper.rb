module IconHelper

	def toolbar_icon(name, icon, color=nil)
		color_attribute = "style='color: #{color}'" unless color.nil?
		( "<span class='#{icon} ion-big' #{color_attribute}></span><br>#{name}" ).html_safe
	end

	def inline_icon(name, icon, color=nil)
		color_attribute = "style='color: #{color}'" unless color.nil?
		( "<span class = '#{icon}' #{color_attribute}></span> #{name}" ).html_safe
	end

	def square_icon(icon, color=nil)
		content_tag("span", "", class: "square_icon #{icon}")
	end

end