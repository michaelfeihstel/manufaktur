# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ContactRole
remove_contact_roles = ContactRole.destroy_all
create_contact_roles = ContactRole.create(
  [
    { id: 1, name: "Händler" },
    { id: 2, name: "Zulieferer" },
    { id: 3, name: "Mitarbeiter" },
    { id: 4, name: "Endkunde" },
    { id: 5, name: "Sonstige" }
  ]
)