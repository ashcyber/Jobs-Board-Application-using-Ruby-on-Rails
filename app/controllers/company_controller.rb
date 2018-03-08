class CompanyController < ApplicationController
  
  def new
    @company = Company.new
  end
  
  def create
    @company = Company.new(company_params)
    if @company.save && verify_recaptcha(model: @company) 
      flash.now[:success] = "Thank You For Sharing Your Hiring Requirements."
      render 'new'
    else 
      render 'new'
    end 
    
    
  end 
  
  private 
  
  
    def company_params
        @comp_cont_name = params[:comp_cont_name]
        @comp_name = params[:comp_name]
        @comp_email = params[:comp_email]
        @comp_contact = params[:comp_contact]
        @comp_req_pos = params[:comp_req_pos]
        @comp_req_loc = params[:comp_req_loc]
        @comp_req_skill = params[:comp_req_skill]
        @comp_job_description = params[:company_job_description]
        params = ActionController::Parameters.new(:company_name => @comp_name, :contact_person => @comp_cont_name, :email => @comp_email,
        :contact_number => @comp_contact, :position => @comp_req_pos, :job_location => @comp_req_loc,
        :key_skill => @comp_req_skill, :job_description => @comp_job_description)
  
        params.permit(:company_name, :contact_person, :email, :contact_number, :position, :job_location, :key_skill, :job_description)
    end 
  
  
end
