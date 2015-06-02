module OrdersHelper

  def marked_icon(order, options={})
    status_label = order.marked_status_label if options[:status_label] == true
    action_label = order.marked_action_label if options[:action_label] == true

    if order.marked?
      icon("star", text: status_label || action_label)
    else
      icon("star_border", text: status_label || action_label)
    end
  end



  def completed_icon(order, options={})
    status_label = order.completed_status_label if options[:status_label] == true
    action_label = order.completed_action_label if options[:action_label] == true

    if order.completed_at
      icon("done", text: status_label || action_label)
    else
      icon("hourglass_empty", additional_classes: "light", text: status_label || action_label)
    end
  end



  def paid_icon(order, options={})
    label = order.paid_label if options[:label] == true

    if order.paid_on
      icon("attach_money", text: label)
    else
      icon("attach_money", text: label, additional_classes: "light")
    end
  end



  def payment_status(order)
    if order.invoiced_at.nil?
      "-"
    elsif order.paid_on
      "Bezahlt nach #{distance_of_time_in_words(order.invoiced_at, order.paid_on)}"
    else
      "Ausstehend seit #{time_ago_in_words(order.invoiced_at)}"
    end
  end


end
