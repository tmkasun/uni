class Subject < ActiveRecord::Base
 has_many :questions , dependent: :destroy
 has_many :resumes 
 # :name , :id , :subject_code
 
end
