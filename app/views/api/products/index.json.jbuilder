json.products @products do |product|
  json.id product.id
  json.name product.name
  json.sku product.sku
  json.color_text product.color_text
  json.sku_name_color product.sku_name_color
  json.price product.price
  json.vat product.vat
  json.primary_color product.primary_color
  json.secondary_color product.secondary_color
  json.text_color product.text_color
  json.size do
    json.id product.try(:size).try(:id)
    json.name product.try(:size).try(:name)
  end
end