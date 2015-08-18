class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|

      t.integer :problem_id
      t.text :description

      t.timestamps
    end
  end
end
