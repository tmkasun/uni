# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "seeding data into database \n"
dump_file = File.open("#{Rails.root}/test/fixtures/b11.yml")
yaml_file = YAML::load_file(dump_file)

yaml_file.each do |record|
  Student.create :registration_number => record["reg_number"]
end
