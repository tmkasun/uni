class GpaController < ApplicationController
  layout :which_layout
  def which_layout
    #because dictionary action is testing action
    mobile_device? ? 'application.mobile.erb' : 'interior_design'
  end
 
  def display_gpa
    @gpacalculate = params[:gpacalculate]
    #render text: params[:gpacalculate].inspect

    @ind = 0 
    @sub = Array.new
      while @ind < @gpacalculate.length  do
  	     @sub[@ind] = Subject.where("id = ?", "#{params[:gpacalculate][@ind]}")
	    #@sub = Subject.all
	    #@sub = Subject.find(params[:gpacalculate][@ind])
	    #@subj[$in] = @sub[:name]
	    # return render text: @sub.inspect
	    #render text: @gpacalculate[@ind]
            @ind = @ind+2
	    
      end
  
      @f = 0   
	    while @f < @gpacalculate.length  do 
          if @gpacalculate[@f].blank? 
		     flash[:message] = "Please select your subjects"
		     #return redirect_to gpa_show_path , :gpacal => session[:gpa]
             return redirect_to :back			 
		   end  
		   @f = @f+2
		 end
		 
      @e = 0   
	    while @e < @gpacalculate.length  do 
          if @gpacalculate[@e+1].blank? 
		     flash[:message] = "Please enter your grades to all subjects"
		     #return redirect_to gpa_show_path , :gpacal => session[:gpa]
             return redirect_to :back			 
		   end  
		   @e = @e+2
		 end		 
 end
 
 def enter_level_semester 
 end
 
 def add_subject
 #{"level"=>"", "semester"=>"", "no_of_subjects"=>"2"}
   @no_sub = params[:sub].to_i + 1
   redirect_to gpa_calculate_gpa_path(:gpacal => {"level"=>"#{$level}", "semester"=>"#{$semester}", "no_of_subjects"=>"#{@no_sub}"})
 end
 
 def remove_subject
 #{"level"=>"", "semester"=>"", "no_of_subjects"=>"2"}
   @no_sub_reduce = params[:sub].to_i - 1
   redirect_to gpa_calculate_gpa_path(:gpacal => {"level"=>"#{$level}", "semester"=>"#{$semester}", "no_of_subjects"=>"#{@no_sub_reduce}"})
 end
 
 def create 
 end
 
 
 
 def calculate_gpa 
 #render text: params[:gpacal].inspect
  @gpacal = params[:gpacal]
  $level = @gpacal[:level]
  $semester = @gpacal[:semester]
  #session[:gpa] = @gpacal 
  #if @gpacal.blank?
    #flash[:message] ="Re-enter Data"
    #redirect_to gpa_new_path
  #gon.level = @gpacal[:level]
  #gon.semester = @gpacal[:semester]
  #gon.no_of_subjects = @gpacal[:no_of_subjects]
  
  
  if @gpacal[:no_of_subjects].blank?
    flash[:message] ="Please enter at least the number of subjects"
    redirect_to gpa_enter_level_semester_path 
	
  elsif @gpacal[:no_of_subjects].to_f == 0
    flash[:message] ="Please enter a number to the number of subjects"
    redirect_to gpa_enter_level_semester_path  
  end
  
 end
 
end
