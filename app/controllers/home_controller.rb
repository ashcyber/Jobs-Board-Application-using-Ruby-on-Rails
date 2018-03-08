class HomeController < ApplicationController
  
  def index
     @contact = Contact.new
  end 
  
  def contact_us
    @contact = Contact.new(contact_params)
        if @contact.save && verify_recaptcha(model: @contact) 
            flash.now[:success] = "Thank You For Contacting Us"
            render 'index'
        else
            render 'index'
        end 
  end 
  
  def view_details
    @job_id = params[:job_id]
    @current_job = Job.find_by(id: @job_id)
    render 'job_view'
  end 
  
  
  
  def view_job_index
    @job_key_word = params[:search_key_word]
    @job_key_word = @job_key_word.split(/[^\w-]+/)
    @filter_key_word = @job_key_word.map {|item| Job.sanitize(item.downcase.gsub(/[^0-9A-Za-z]/, ''))}
    
    query = ""
    if @filter_key_word.empty?
      query = "select * from jobs"
    else 
      query = "select * from jobs where "
      @filter_key_word.each_with_index do |item, index|
        query << " (lower(job_description) LIKE '%#{item[1..-2]}%'"
        
        
        if index < @filter_key_word.length 
          query << " OR "
        end
        
        query << " lower(pos_location) LIKE '%#{item[1..-2]}%'"
        
        if index < @filter_key_word.length 
          query << " OR "
        end
        
        query << " lower(pos_name) LIKE '%#{item[1..-2]}%'"
        
        if index < @filter_key_word.length 
          query << " OR "
        end
        
        query << " lower(key_skill) LIKE '%#{item[1..-2]}%')"
        
        
        if index < @filter_key_word.length - 1 
          query << " AND "
        end
      end
    end 
    
    
    
    @result =  ActiveRecord::Base.connection.execute(query)
      
      
      @job_id = [] 
      @result.each do |row|
        @job_id.push(row["id"])
      end
      
      
    if @job_id.empty?
      flash.now[:notice] = "No jobs match your key word"
      render 'jobs_index'
    else
        @all_jobs = Job.order(updated_at: :desc).where(id: @job_id)
        render 'jobs_index'
    end 
end 
  
  
    private 
  
    def contact_params
          @form_name = params[:form_name]
          @form_email = params[:form_email]
          @form_contact = params[:form_contact]
          @form_message = params[:form_message]
          params = ActionController::Parameters.new(:name => @form_name, :email => @form_email, :contact_number => @form_contact, :message => @form_message)

          params.permit(:name, :email, :contact_number, :message)
    end 

  
end
