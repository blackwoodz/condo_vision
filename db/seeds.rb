# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

require 'csv'

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'units.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   t = Unit.new
#   t.unit_number = row['unit_number']
#   t.monthly_dues = row['monthly_dues']
#   t.save
#   puts "#{t.unit_number}, #{t.monthly_dues} saved"
# end
#
# puts "There are now #{Unit.count} rows in the units table"
#
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'users.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   t = User.new
#   t.first_name = row['first_name']
#   t.last_name = row['last_name']
#   t.email = row['email']
#   t.contact_phone_number = row['contact_phone_number']
#   t.password = row['password']
#   t.current_board_member = row['current_board_member']
#   t.site_admin = row['site_admin']
#   t.save
#   puts "#{t.first_name} #{t.last_name} saved"
# end
#
# puts "There are now #{User.count} users in the User table"

# csv_text = File.read(Rails.root.join('lib', 'seeds', 'tenants.csv'))
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   t = Tenancy.new
#   t.unit_id = row['unit_id']
#   t.tenant_id = row['tenant_id']
#   t.start_date = row['start_date']
#   t.save
#   puts "#{t.tenant_id} saved"
# end
#
# puts "There are now #{Tenancy.count} tenancies in the Tenancy table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'owners.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Ownership.new
  t.unit_id = row['unit_id']
  t.owner_id = row['owner_id']
  t.start_date = row['start_date']
  t.save
  puts "#{t.owner_id} saved"
end

puts "There are now #{Ownership.count} ownerships in the Ownership table"
