class CreateProblemUserMappings < ActiveRecord::Migration
  def change
    create_table :problem_user_mappings do |t|

      t.integer :problem_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
