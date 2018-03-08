class AddAttachmentToCandidate < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :attachment, :string
  end
end
