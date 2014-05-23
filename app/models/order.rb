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
#

class Order < ActiveRecord::Base

  # RELATIONS
  belongs_to :contact
  belongs_to :billing_address, foreign_key: "billing_address_id", class_name: "Address"
  belongs_to :delivery_address, foreign_key: "delivery_address_id", class_name: "Address"
  has_many :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items, :allow_destroy => true

  # VALIDATIONS

  # CALLBACKS

  before_save :get_references

  def get_references
    self.billing_name = billing_address.name
    self.billing_street = billing_address.street
    self.billing_house_number = billing_address.house_number
    self.billing_zip = billing_address.zip
    self.billing_city = billing_address.city
    self.billing_country = billing_address.country
    self.delivery_name = delivery_address.name
    self.delivery_street = delivery_address.street
    self.delivery_house_number = delivery_address.house_number
    self.delivery_zip = delivery_address.zip
    self.delivery_city = delivery_address.city
    self.delivery_country = delivery_address.country
  end

  # SCOPES

  scope :marked_as_favorite, -> { where(marked: true) }
  
  # METHODS

  include IconHelper

  def subtitle
  	if self.delivery_address_id != self.billing_address_id
  		( "<i class='ion-ios7-redo'></i>" + self.delivery_address.full_address(0) ).html_safe
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
