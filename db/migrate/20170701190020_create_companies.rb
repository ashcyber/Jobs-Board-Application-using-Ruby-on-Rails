class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :contact_person
      t.string :email
      t.string :contact_number
      t.string :position
      t.string :job_location
      t.string :key_skill

      t.timestamps
    end
  end
end
