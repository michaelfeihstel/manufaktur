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

# WorkSteps
remove_work_steps = WorkStep.destroy_all
create_work_steps = WorkStep.create(
  [
    { id: 1, name: "Zuschnitt Laser" },
    { id: 2, name: "Zuschnitt Wasserstrahl" },
    { id: 3, name: "Schaft Vorrichten" },
    { id: 4, name: "Schaft Vorlegen" },
    { id: 5, name: "Seitenteil & Vorderblatt" },
    { id: 6, name: "Ösenteil & Herzchen" },
    { id: 7, name: "Quartierfutter einnähen & lochen" },
    { id: 8, name: "Fersenkappe vorformen & einkleben" },
    { id: 9, name: "Boden einstrobeln & Senkel einziehen" },
    { id: 10, name: "Mittel- & Außensohle schneiden" },
    { id: 11, name: "Rohling Anstrich & Verpressen" },
    { id: 12, name: "Außen- und Mittelsohle rauen" },
    { id: 13, name: "Schaft & Sohle Anstrich" },
    { id: 14, name: "Verheiraten" },
    { id: 15, name: "Endkontrolle" },
    { id: 16, name: "Verpacken" },
    { id: 17, name: "Zunge (Finale)" }
  ]
)