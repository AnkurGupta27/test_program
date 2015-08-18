class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|

      t.integer :problem_id
      t.text :description
      t.integer :solved_by

      t.timestamps
    end
  end
end
