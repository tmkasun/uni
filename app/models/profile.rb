class Profile < ActiveRecord::Base
  
  STREAMS = %w[math biology commerce arts] #http://stackoverflow.com/questions/1274675/ruby-what-does-warray-mean --> http://www.zenspider.com/Languages/Ruby/QuickRef.html#4
  
  has_attached_file :picture , styles: {small: "150x150>"},default_url: "profile/default-avatar.png" 
  validates_attachment :picture, size: {in: 0..5.megabytes}#, :content_type => { :content_type => ["image/jpg", "image/gif", "image/png","image/bmp"] } 
  def self.search(search_key)
    
    if is_number?(search_key.first)
      result = where('registration_number ilike ?',"#{search_key.to_s}%").limit(15).order(:registration_number) 
    else
      result = where('common_name ilike ? or name ilike ? ',"#{search_key.to_s}%","%#{search_key.to_s}%").limit(15).order(:common_name)
    end
    

  end
  
  private

  def self.is_number? number
    true if Float(number) rescue false
  end

end
