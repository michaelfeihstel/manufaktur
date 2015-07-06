module ProductsHelper
  def product_label_style(product, border_align: "bottom")
    c1 = product.primary_color.blank? ? "#F2F2F2" : product.primary_color
    c2 = product.secondary_color.blank? ? "#E3E3E3" : product.secondary_color
    c3 = product.text_color || "#333"

    back = "background-color: #{c1};"
    border = "border-#{border_align}: 4px solid #{c2};"
    text = "color: #{c3};"

    "#{back} #{border} #{text}"
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
    primary_color = product.primary_color
    secondary_color = product.secondary_color
    text_color = product.text_color

    unless primary_color.empty? || secondary_color.empty? || text_color.empty?
      "background-color: #{primary_color}; border-bottom: 5px solid #{secondary_color};"
    end
  end
end