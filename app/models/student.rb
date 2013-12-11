class Student < ActiveRecord::Base
  
  
  def self.search(search_key)
    
    if is_number?(search_key.first)
      result = where('registration_number ilike ?',"#{search_key.to_s}%").limit(15).order(:registration_number) 
    else
      result = where('common_name ilike ? or name like ? ',"#{search_key.to_s}%","%#{search_key.to_s}%").limit(15).order(:common_name)
    end
    

  end
  
  private

  def self.is_number? number
    true if Float(number) rescue false
  end

end
