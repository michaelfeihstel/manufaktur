ActiveAdmin.register Product do

end

ActiveAdmin.register ProductImage do
  belongs_to :product
end
