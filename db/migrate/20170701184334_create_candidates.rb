class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :contact
      t.integer :experience
      t.string :key_skill
      t.string :education
      t.string :current_location

      t.timestamps
    end
  end
end
