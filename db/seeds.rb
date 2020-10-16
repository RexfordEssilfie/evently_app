# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Loading fake users into the database
require 'csv'

csv_users_text = File.read(Rails.root.join('lib', 'seeds', 'fake_users.csv'))
csv = CSV.parse(csv_users_text, :force_quotes => true, :headers => true, :quote_char => "'", :encoding => 'ISO-8859-1')
csv.each do |row|
  name = row['name']
  email = row['email']
  password = row['password']
  t= User.new({name: name, email: email, password: password, password_confirmation: password})
  puts t.inspect
  t.save!
  puts t.errors.full_messages

  if t.valid?
    puts "#{t.name}, #{t.email} saved"
  else
    puts "#{t.name}, #{t.email} not saved"
  end
end

puts "There are now #{User.count} rows in the users table"


csv_events_text = File.read(Rails.root.join('lib', 'seeds', 'events.csv'))
csv = CSV.parse(csv_events_text, :force_quotes => true, :headers => true, :quote_char => "'", :encoding => 'ISO-8859-1')
csv.each do |row|
  name = row['name']
  description = row['description']
  location = row['location']
  start_time = row['start_time']
  end_time = row['end_time']
  visibility = row['visibility']
  user_id = row['user_id']

  e= Event.new({name: name, description: description, location: location, start_time: start_time, end_time: end_time, visibility: visibility, user_id: user_id})
  puts e.inspect
  e.save!
  puts e.errors.full_messages

  if e.valid?
    puts "#{e.name}, #{e.user_id} saved"
  else
    puts "#{e.name}, #{e.user_id} not saved"
  end
end

puts "There are now #{Event.count} rows in the events table"