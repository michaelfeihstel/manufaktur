module OrdersHelper

	def marked_icon(order, options={})
		label = order.marked_label if options[:label] == true

		if order.marked?
			icon("star-fill", text: label)
		else
			icon("star", text: label)
		end
	end

	def completed_icon(order, options={})
		label = order.completed_label if options[:label] == true

		if order.completed_at
			icon("check2-fill", text: label)
		else
			icon("check2", text: label)
		end
	end

	def paid_icon(order, options={})
		label = order.paid_label if options[:label] == true

		if order.paid_on
			icon("euro-fill", text: label)
		else
			icon("euro", text: label)
		end
	end



end
