module ProductsHelper
	def product_color(product)
		c1 = product.primary_color.to_s
		c2 = product.secondary_color

		c1.to_s
	end
end
