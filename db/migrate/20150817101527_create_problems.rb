class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|

      t.integer :project_id
      t.text :description
      t.string :type
      t.integer :attachment_url
      t.string :created_by
      t.string :updated_by


      t.timestamps
    end
  end
end
