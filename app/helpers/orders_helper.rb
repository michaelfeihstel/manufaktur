# == Schema Information
#
# Table name: orders
#
#  id                    :integer          not null, primary key
#  delivered_on          :date
#  invoiced_at           :datetime
#  completed_at          :datetime
#  contact_id            :integer
#  billing_address_id    :integer
#  delivery_address_id   :integer
#  billing_name          :string(255)
#  billing_street        :string(255)
#  billing_house_number  :string(255)
#  billing_zip           :string(255)
#  billing_city          :string(255)
#  billing_country       :string(255)
#  delivery_name         :string(255)
#  delivery_street       :string(255)
#  delivery_house_number :string(255)
#  delivery_city         :string(255)
#  delivery_zip          :string(255)
#  delivery_country      :string(255)
#  delivery_iso          :string(255)
#  is_webshop            :boolean
#  created_at            :datetime
#  updated_at            :datetime
#  marked                :boolean          default(FALSE), not null
#  fmid                  :integer
#  comment               :text
#  is_free               :boolean          default(FALSE)
#  is_vat_exempt         :boolean          default(FALSE)
#  paid_on               :date
#  paid_amount           :decimal(8, 2)
#  is_scheduled_delivery :boolean          default(FALSE)
#  cashback_until        :date
#  cashback_percent      :decimal(2, 2)    default(0.03)
#  tax_id                :integer
#

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

    if order.try(:completed_at)
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
