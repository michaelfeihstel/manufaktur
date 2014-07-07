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

	def icon(icon, options={})
		color_attribute = "color: #{options[:color]}" unless options[:color].nil?
		size_attribute = "style='size: #{options[:size]}'" unless options[:size].nil?
		icon_class = "icon-#{icon}"
		additional_classes = options[:class] || nil
		text = " #{options[:text]}" || ""

		icon_span = content_tag(:span, "", class: "#{icon_class} #{additional_classes}", style: "#{color_attribute}")
		text_span = content_tag(:span, text, class: "icon-text #{additional_classes}", style: "#{color_attribute}")
		(icon_span + text_span).html_safe
	end

	def boolean_icon(value)
		if value == true
			icon("check-square", color: "#00D300", class: "right")
		else
			icon("cross-square", color: "#FF766F", class: "right")
		end
	end

end