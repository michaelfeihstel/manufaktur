module OrdersHelper
	def month_calendar_td_options
	  ->(created_at, current_calendar_date) {
	    {class: "calendar-date", data: {day: current_calendar_date}}
	  }
	end
end
