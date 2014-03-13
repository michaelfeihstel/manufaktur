# == Schema Information
#
# Table name: orders
#
#  id                    :integer          not null, primary key
#  date_delivery         :date
#  date_invoice          :date
#  date_completed        :date
#  contact_id            :integer
#  billing_address_id    :integer
#  delivery_address_id   :integer
#  billing_name          :string(255)
#  billing_street        :string(255)
#  blling_house_number   :string(255)
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
#  webshop?              :boolean
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
    if date_completed.blank?
      inline_icon("Abschließen", "ion-ios7-checkmark-empty")
    else
      inline_icon("Abgeschlossen", "ion-checkmark-circled", "limegreen")
    end
  end

  def mark_as_completed
    if date_completed.blank?
      update_attributes(:date_completed => Date.today)
    else
      update_attributes(:date_completed => "")
    end
  end
end
