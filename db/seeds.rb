# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Loading fake users into the database
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'fake_users.csv'))
csv = CSV.parse(csv_text, :force_quotes => true, :headers => true, :quote_char => "'", :encoding => Encoding::UTF_8)
File.open(Rails.root.join('lib', 'seeds', 'fake_users.csv')) do |f|
  f.each_line do |row|
  columns = row.split(",")
  t = User.new
  t.name = columns[0]
  t.email = columns[1]
  t.password = columns[2]
  t.password_confirmation = columns[3]
  t.save
  puts columns[2..3]
  puts t.errors.full_messages

  if t.valid?
    puts "#{t.name}, #{t.email} saved"
  else
    puts "#{t.name}, #{t.email} not saved"
  end

end
end

puts "There are now #{User.count} rows in the users table"