class Company < ApplicationRecord
  mount_uploader :job_description, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :company_name, presence: true, length: { maximum: 100}
  validates :contact_person, presence: true, length: { maximum: 100}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_CONTACT_REGEX = /[+\s*0-9-*]+[0-9]/i

  validates :email, presence: true,length: {maximum: 100}, format: { with: VALID_EMAIL_REGEX }
  
  validates :contact_number, presence: true, length: { maximum: 30}, format: {with: VALID_CONTACT_REGEX}
  validates :job_location, presence: true, length: { maximum: 50}
  validates :key_skill, presence: true, length: { maximum: 200}
  
  
end
