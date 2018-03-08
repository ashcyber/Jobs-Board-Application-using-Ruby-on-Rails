class AddJobDescriptionToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :job_description, :string
  end
end
