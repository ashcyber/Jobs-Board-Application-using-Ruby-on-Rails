ActiveAdmin.register Job do
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
  permit_params :pos_name, :pos_location, :experience, :salary_range, :key_skill, :job_description

  index do
    selectable_column
    column :id
    column :pos_name
    column :pos_location
    column :experience
    column :salary_range
    column :key_skill
    actions
  end

  
end
