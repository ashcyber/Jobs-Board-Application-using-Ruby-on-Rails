ActiveAdmin.register Candidate do
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

  permit_params :name, :email, :contact, :experience, :key_skill, :education, :current_location, :attachment
    
    index do
      selectable_column
      column :id 
      column :name
      column :email 
      column :experience
      column :key_skill
      column :education
      column :current_location
      column :attachment do |attch|
        link_to('Download Resume',"#{attch.attachment.url}")
      end
      column :updated_at 
      actions
    end

    # Show table methods can modify the view for the view controller in admin 
    # show do |t|
    #   attributes_table do 
    #     row :pos_name 
    #     row :pos_location do |ad|
    #       link_to(ad.pos_location, "http://www.example.com")
    #     end 
    #   end
    # end
  
  
  
end
