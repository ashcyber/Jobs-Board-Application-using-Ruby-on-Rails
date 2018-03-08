class Candidate < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_CONTACT_REGEX = /[+\s*0-9-*]+[0-9]/i
    validates :email, length: {maximum: 100}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    
    validates :contact,format: {with: VALID_CONTACT_REGEX }, length: {maximum: 30}
    validates :experience, presence: true, length: {maximum: 3}
    validates :key_skill, presence: true, length: {maximum: 200}
    validates :education, presence: true, length: {maximum: 100}
    validates :current_location, presence: true, length: {maximum: 50}
    validates :attachment, presence: true

  
end
