# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  sku               :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  price             :decimal(8, 2)
#  vat               :decimal(, )
#  color_text        :string(255)
#  variation_set_id  :integer
#  fmid              :integer
#  primary_color     :string(255)
#  secondary_color   :string(255)
#  text_color        :string(255)      default("#fff")
#  size_set_id       :integer
#  product_family    :string
#  retail_price      :decimal(8, 2)
#  product_family_id :integer
#

module ProductsHelper
  def product_label_style(product, border_align: "bottom")
    unless product.nil?
      c1 = product.primary_color.blank? ? "#F2F2F2" : product.primary_color
      c2 = product.secondary_color.blank? ? "#E3E3E3" : product.secondary_color
      c3 = product.text_color || "#333"

      back = "background-color: #{c1};"
      border = "border-#{border_align}: 4px solid #{c2};"
      text = "color: #{c3};"

      "#{back} #{border} #{text}"
    end
  end

  def product_label(product)
    unless product.nil?
      primary_color = product.primary_color.blank? ? "#F2F2F2" : product.primary_color
      secondary_color = product.secondary_color.blank? ? "#E3E3E3" : product.secondary_color
      text_color = product.text_color || "#333"

      content_tag :div, class: "product-label product-label--fixed" do
        content_tag(:div, product.try(:sku), class: "product-label__top", style: "background-color: #{primary_color}; color: #{text_color};").concat(
          content_tag :div, "", class: "product-label__bottom", style: "background-color: #{secondary_color}"
        )
      end
    end
  end

  def product_label_square(product)
    unless product.nil?
      content_tag :div, class: "product-label product-label--square", data: { tooltip: product.sku } do
        content_tag(:div, "", class: "product-label__top", style: "background-color: #{product.primary_color}; color: #{product.text_color};").concat(
          content_tag :div, "", class: "product-label__bottom", style: "background-color: #{product.secondary_color}"
        )
      end
    end
  end

  def horizontal_gradient(product)
    primary_color = product.primary_color
    secondary_color = product.secondary_color
    text_color = product.text_color

    "linear-gradient(to right, #{primary_color}, #{secondary_color})"
  end

  def diagonal_gradient(product)
    primary_color = product.primary_color
    secondary_color = product.secondary_color
    text_color = product.text_color

    "linear-gradient(to bottom right, #{primary_color}, #{secondary_color})"
  end

  def line_item_header(product)
    unless product.nil?
      primary_color = product.primary_color
      secondary_color = product.secondary_color
      text_color = product.text_color

      "background-color: #{primary_color}; border-bottom: 5px solid #{secondary_color};"
    end
  end
end
