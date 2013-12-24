# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#{"reg_number"=>"115047A", "name"=>"A.L. Abdul Wajeeth", "cname"=>"Abdul", "yr_grp"=>"A1", "pno"=>"0714149351", "home"=>"Polonnaruwa", "school"=>"Pl/Al-Hilal Central", "strm"=>"Commerce", "dgre"=>"ITM", "nat"=>"Moor", "reg"=>"Islam", "pass"=>"e10adc3949ba59abbe56e057f20f883e", "profile_pic"=>"./mm/student_photos/115047A"}
def load_student_data
  puts "Loading Students data to Rails DB"
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
end

def import_student_profile_pictures
  images_base_path = "/home/kbsoft/Desktop/Uni_work/Level2_semester1/_4local/mm/student_photos/"
  #inet_base_url = "http://www.itfac.mrt.ac.lk/Students/Batch11it/"
  inet_base_url = "http://www.itfac.mrt.ac.lk/Students/Batch11itm/"
  puts "importing students profile pictures"
  all_profiles = Profile.all
  fail_count = 0
  sucusess_count = 0

  all_profiles.each do |profile|

    begin
      unless profile.picture.blank?
        puts "Skiped #{profile.registration_number}"
      next
      end
      remote_photo = open(inet_base_url+profile.registration_number.upcase+".bmp")

      def remote_photo.original_filename;base_uri.path.split('/').last; end
      puts "Sucsussfully added #{profile.registration_number}"
      profile.picture =  remote_photo
      puts profile.save
      sucusess_count +=1
    rescue OpenURI::HTTPError => e
      puts "fail to added #{profile.registration_number}"
    fail_count +=1
    end

    
  # begin
  # remote_photo = File.new(images_base_path+profile.registration_number.upcase+".jpg")
  # puts "Sucsussfully added #{profile.registration_number}"
  # profile.picture =  remote_photo
  #  puts profile.save

  #
  # rescue Errno::ENOENT => e
  # puts "fail to added #{profile.registration_number}"
  # sucusess_count +=1
  # end

  end
  puts "failed=#{fail_count}, sucsussed = #{sucusess_count}"

end

#load_student_data
import_student_profile_pictures

