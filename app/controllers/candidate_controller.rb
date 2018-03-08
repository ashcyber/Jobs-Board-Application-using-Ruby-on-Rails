class CandidateController < ApplicationController
  def new
    @candidate = Candidate.new
  end
  
  
  def create
    
    @candidate = Candidate.new(job_params)
          if @candidate.save && verify_recaptcha(model: @candidate)
              flash.now[:success] = "Thank You Submitting Your Resume"
              render 'new'
          else
              render 'new'
          end 

  end
  
  
  private 
  
    def job_params
          @cand_name = params[:cand_name]
          @cand_email = params[:cand_email]
          @cand_contact = params[:cand_contact]
          @cand_exp = params[:cand_exp]
          @cand_skill = params[:cand_skill]
          @cand_edu = params[:cand_edu]
          @cand_loc = params[:cand_loc]
          @cand_resume = params[:cand_resume]
          params = ActionController::Parameters.new(:name => @cand_name, :email => @cand_email,:contact => @cand_contact,
    :experience => @cand_exp, :key_skill => @cand_skill, :education => @cand_edu, :current_location => @cand_loc, :attachment => @cand_resume)

          params.permit(:name, :email, :contact, :experience, :key_skill, :education, :current_location, :attachment)
    end 
end
