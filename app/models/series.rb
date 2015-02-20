# == Schema Information
#
# Table name: series
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  finished_on :date
#  comment     :text
#  us1         :integer
#  us1h        :integer
#  us2         :integer
#  us2h        :integer
#  us3         :integer
#  us3h        :integer
#  us4         :integer
#  us4h        :integer
#  us5         :integer
#  us5h        :integer
#  us6         :integer
#  us6h        :integer
#  us7         :integer
#  us7h        :integer
#  us8         :integer
#  us8h        :integer
#  us9         :integer
#  us9h        :integer
#  us10        :integer
#  us10h       :integer
#  us11        :integer
#  us11h       :integer
#  us12        :integer
#  us12h       :integer
#  us13        :integer
#  us13h       :integer
#  us14        :integer
#  us14h       :integer
#  us15        :integer
#  us16        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Series < ActiveRecord::Base
  belongs_to :product
end
