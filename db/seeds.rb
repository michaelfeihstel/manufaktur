# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ProductFamily
remove_product_families = ProductFamily.destroy_all
create_product_families = ProductFamily.create(
  [
    { id: 1, name: "Classic Run" },
    { id: 2, name: "Classic Walk" },
    { id: 3, name: "Evo Run" },
    { id: 4, name: "Accento" },
    { id: 5, name: "Light" },
    { id: 6, name: "Gomax" },
    { id: 7, name: "Classic Run Fis" },
    { id: 8, name: "Neo Run" }
  ]
)

# Carriers
remove_carriers = Carrier.destroy_all
create_carriers = Carrier.create(
  [
    { id: 1, name: "DPD", tracking_link: "http://extranet.dpd.de/cgi-bin/delistrack?pknr=###TRACKING_CODE###&typ=1&lang=de" },
    { id: 2, name: "DHL", tracking_link: "http://nolp.dhl.de/nextt-online-public/set_identcodes.do?lang=de&idc=###TRACKING_CODE###" }
  ]
)

# Taxes
if Tax.count == 0
  remove_taxes = Tax.destroy_all
  create_taxes = Tax.create(
    [
      { id: 1, name: "Standardsatz (19%)", value: 0.19 },
      { id: 2, name: "Mehrwertsteuerbefreit", value: 0 }
    ]
  )
end

# ContactRole
remove_contact_roles = ContactRole.destroy_all
create_contact_roles = ContactRole.create(
  [
    { id: 1, name: "retailer", human_readable_name: "Händler" },
    { id: 2, name: "supplier", human_readable_name: "Zulieferer" },
    { id: 3, name: "employee", human_readable_name: "Mitarbeiter" },
    { id: 4, name: "customer", human_readable_name: "Endkunde" },
    { id: 5, name: "other", human_readable_name: "Sonstige" }
  ]
)

# WorkSteps
if WorkStep.count == 0
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
      { id: 15, name: "Endkontrolle", final_step: true },
      { id: 16, name: "Verpacken" },
      { id: 17, name: "Zunge (Finale)" }
    ]
  )
end