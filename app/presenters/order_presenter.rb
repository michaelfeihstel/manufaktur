class OrderPresenter
  def initialize(order, view_context=nil)
    @order = order
    @view = view_context
  end

  def completed_status
    if order.completed_at
      view.l order.completed_at, format: :date_only
    else
      "In Bearbeitung"
    end
  end

  def invoice_date
    if order.invoiced_at
      view.l order.invoiced_at, format: :date_only
    else
      '-'
    end
  end

  def cashback_date
    if order.cashback_until
      view.l order.cashback_until
    else
      "-"
    end
  end

  def cashback_percent_formatted
    view.number_to_percentage order.cashback_percent * 100
  end

  def payment_date
    if order.paid_on
      view.l order.paid_on
    else
      "-"
    end
  end

  def payment_status
    if order.invoiced_at && order.paid_on
      "Bezahlt nach #{view.distance_of_time_in_words(order.invoiced_at, order.paid_on)}."
    elsif order.invoiced_at
      "Ausstehend seit #{view.time_ago_in_words(order.invoiced_at)}"
    else
      '-'
    end
  end

  def marked_icon
    if order.marked?
      view.icon("star", text: "Aus Favoriten entfernen")
    else
      view.icon("star_border", text: "Zu Favoriten hinzufügen")
    end
  end

  def complete_action
    if order.completed?
      view.icon("done", text: "Abgeschlossen am #{view.l order.completed_at, format: :date_only}")
    else
      view.icon("hourglass_empty", text: "Abschließen")
    end
  end



  private
  attr_reader :order, :view
end