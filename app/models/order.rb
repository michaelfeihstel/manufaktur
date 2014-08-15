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
#

class Order < ActiveRecord::Base
  
  # RELATIONS
  belongs_to :contact
  belongs_to :billing_address, foreign_key: "billing_address_id", class_name: "Address"
  belongs_to :delivery_address, foreign_key: "delivery_address_id", class_name: "Address"
  has_many :line_items, :dependent => :destroy
  has_many :products, through: :line_items
  has_many :sizes, through: :products
  accepts_nested_attributes_for :line_items, :allow_destroy => true

  # VALIDATIONS

  # CALLBACKS

  before_save :get_references

  def get_references
    self.billing_name ||= try(:billing_address).try(:name)
    self.billing_street ||= try(:billing_address).try(:street)
    self.billing_house_number ||= try(:billing_address).try(:house_number)
    self.billing_zip ||= try(:billing_address).try(:zip)
    self.billing_city ||= try(:billing_address).try(:city)
    self.billing_country ||= try(:billing_address).try(:country)
    self.delivery_name ||= try(:delivery_address).try(:name)
    self.delivery_street ||= try(:delivery_address).try(:street)
    self.delivery_house_number ||= try(:delivery_address).try(:house_number)
    self.delivery_zip ||= try(:delivery_address).try(:zip)
    self.delivery_city ||= try(:delivery_address).try(:city)
    self.delivery_country ||= try(:delivery_address).try(:country)
  end

  # SCOPES

  scope :marked_as_favorite, -> { where(marked: true) }
  
  # METHODS

  include IconHelper

  def completed?
    if completed_at.present?
      true
    else
      false
    end
  end

  def quantity_total
    self.line_items.to_a.sum(&:quantity)
  end

  def price_total
    self.line_items.to_a.sum(&:gross_price_total)
  end

  def price_cashback
    price_total * (1 - cashback_percent)
  end

  def time_for_payment
    if paid_on
      "Bezahlt nach #{distance_of_time_in_words(invoiced_at, paid_on)} Tagen."
    else
      "Ausstehend seit #{time_ago_in_words(invoiced_at)} Tagen."
    end
  end

  def marked_status_label
    if marked
      "Auf Favoritenliste"
    else
      "Nicht auf Favoritenliste"
    end
  end

  def marked_action_label
    if marked
      "Aus Favoriten entfernen"
    else
      "Zu Favoriten hinzufügen"
    end
  end

  def completed_status_label
    if completed_at
      "Abgeschlossen am #{I18n.localize completed_at, format: :date_only}"
    else
      "In Bearbeitung"
    end
  end

  def completed_action_label
    if completed_at
      "Abgeschlossen widerrufen"
    else
      "Abschliessen"
    end
  end

  def paid_label
    if paid_on
      "Bezahlt"
    else
      "Zahlung ausstehend"
    end
  end

  def formatted_invoice_date
    if invoiced_at
      I18n.l invoiced_at, format: :date_only
    else
      "-"
    end
  end

  def formatted_cashback_date
    if invoiced_at
      I18n.l invoiced_at.advance(days: 10), format: :date_only
    else
      "-"
    end
  end

  



  def marked_toolbar_icon
    if marked == true    
      toolbar_icon("Markiert", "ion-ios7-star", "limegreen")
    else
      toolbar_icon("Markieren", "ion-ios7-star-outline")
    end
  end

  def marked_inline_icon
    if marked == true
      inline_icon("Markiert", "ion-ios7-star", "limegreen")
    else
      inline_icon("Markieren", "ion-ios7-star-outline")
    end
  end

  def mark_as_marked
    if marked == true
      update_attributes(:marked => false)
    else
      update_attributes(:marked => true)
    end
  end



  def completed_toolbar_icon
    if date_completed.blank?
      toolbar_icon("Abschließen", "ion-ios7-checkmark-empty")
    else
      toolbar_icon("Abgeschlossen", "ion-checkmark-circled", "limegreen")
    end
  end

  def completed_inline_icon
    if completed_at.blank?
      inline_icon("Abschließen", "ion-ios7-checkmark-empty")
    else
      inline_icon("Abgeschlossen", "ion-checkmark-circled", "limegreen")
    end
  end

  def mark_as_completed
    if completed_at.blank?
      update_attributes(:completed_at => Time.now)
    else
      update_attributes(:completed_at => "")
    end
  end

end
