class Problem < ActiveRecord::Base

  self.inheritance_column = "type"

  belongs_to :project
  has_many :solutions

  def self.create_problem(problem, type,project)
    Problem.create!(description: problem, type: type, project_id: project.id)
  end


  attr_accessible :description, :type, :project_id
end
