# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#{"reg_number"=>"115047A", "name"=>"A.L. Abdul Wajeeth", "cname"=>"Abdul", "yr_grp"=>"A1", "pno"=>"0714149351", "home"=>"Polonnaruwa", "school"=>"Pl/Al-Hilal Central", "strm"=>"Commerce", "dgre"=>"ITM", "nat"=>"Moor", "reg"=>"Islam", "pass"=>"e10adc3949ba59abbe56e057f20f883e", "profile_pic"=>"./mm/student_photos/115047A"}

puts "seeding data into database \n"
dump_file = File.open("#{Rails.root}/test/fixtures/b11.yml")
yaml_file = YAML::load_file(dump_file)

Profile.destroy_all
puts "\n\n******All records destroyed******\n\n"
yaml_file.each do |record|
  result = Profile.create!(
  :registration_number => record["reg_number"],
  :name => record["name"],
  :common_name => record["cname"],
  :group => record["yr_grp"],
  :phone_number => record["pno"],
  :home_address => record["home"],
  :school => record["school"],
  :al_stream => record["strm"],
  :degree => record["dgre"],
  :nationality => record["nat"],
  :profile_picture_location => record["profile_pic"],
  :gender => record["sex"]|| "N/A")
  puts result
  #return false
end
