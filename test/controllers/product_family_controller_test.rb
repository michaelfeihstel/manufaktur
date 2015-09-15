require 'test_helper'

class ProductFamiliesControllerTest < ActionController::TestCase
  setup  do
    @product_family = product_families(:default)
    @user = users(:default_user)
    sign_in @user
  end
end
