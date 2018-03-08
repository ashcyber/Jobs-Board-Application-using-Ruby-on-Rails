# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base
    
    
    if Rails.env.production?
        storage :fog
    else 
        storage :file 
    end 
    
    
    # This stores the file in same directory in s3 
    def store_dir 
	    "uploads/MdytHX9u3q3P7Ypl7hiM0BKXgn85VFY3JQPds0ZFG36g2Ml4bsl7Wz3btj9J"
    end
    
    
    # Whitelist for allowed files for resumes 
    def extension_white_list
       %w(doc docx pdf rtf)
    end

  
end

