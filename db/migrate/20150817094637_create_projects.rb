class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.string :title
      t.text :description
      t.string :status
      t.float :amount
      t.integer :duration
      t.string :category
      t.string :owner
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end
end
