class AddColumnAssignedToInProjects < ActiveRecord::Migration


def change
    add_column :projects, :assigned_to, :integer
  end
end
