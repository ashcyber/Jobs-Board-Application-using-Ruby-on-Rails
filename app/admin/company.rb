ActiveAdmin.register Company do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  
  permit_params :company_name, :contact_person, :email, :contact_number, :position, :job_location, :key_skill, :job_description
      index do
      selectable_column
      column :id 
      column :company_name
      column :contact_person
      column :email
      column :contact_number
      column :position
      column :lob_location
      column :key_skill
      column :job_description do |jd|
        link_to('Download JD',"#{jd.job_description.url}")
      end
      column :updated_at 
      actions
    end

end
