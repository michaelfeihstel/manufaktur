# == Schema Information
#
# Table name: contacts
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  fmid            :integer
#  created_at      :datetime
#  updated_at      :datetime
#  contact_role_id :integer
#  additional_data :hstore
#

module ContactsHelper

	def get_columns(collection, group_type, grouped_by)
		group_clause = "group_by_" + "groupe_type"
		raw collection.group_by_month(grouped_by, format: "%b %Y").count.map{|k, v| k}
	end
  
end
