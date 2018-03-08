# encoding: utf-8
class JobDescriptionUploader < CarrierWave::Uploader::Base

    if Rails.env.production?
        storage :fog
    else 
        storage :file 
    end 
    
    
    # This stores the file in same directory in s3 
    def store_dir 
	    "uploads/YQr0s9WCqKG92ZWIWc33W8buh64NSQ5oSYKT1qT4NqEJJoWLQz"
    end
    
    
    # Whitelist for allowed files for resumes 
    def extension_white_list
       %w(doc docx pdf rtf)
    end
end

