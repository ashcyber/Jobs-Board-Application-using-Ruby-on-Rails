class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :pos_name
      t.string :pos_location
      t.string :experience
      t.string :salary_range
      t.string :key_skill
      t.text :job_description

      t.timestamps
    end
  end
end
