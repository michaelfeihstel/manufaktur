module OrdersHelper

	def marked_icon(order)
		if order.marked?
			icon("flag", text: order.marked_label)
		else
			icon("flag", text: order.marked_label)
		end
	end

	def completed_icon(order)
		if order.completed_at
			icon("check", text: order.completed_label)
		else
			icon("check", text: order.completed_label)
		end
	end



end
