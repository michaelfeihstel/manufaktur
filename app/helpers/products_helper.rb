module ProductsHelper
	def product_color(product, border_align: "bottom")
		c1 = product.primary_color.to_s
		c2 = product.secondary_color
		c3 = product.text_color

		back = "background-color: #{c1};"
		border = "border-#{border_align}: 4px solid #{c2};" unless c2.blank?
		text = "color: #{c3};"

		"#{back} #{border} #{text}"
	end
end
