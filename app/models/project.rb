class Project < ActiveRecord::Base
  # attr_accessible :title, :body


  has_many :problems, :class_name => "Problem", :primary_key => :id, :foreign_key => "project_id"


  state_machine :status  ,:initial => :open do

    event :pick do
      transition :open => :picked
    end

    event :pending_qc do
      transition :picked => :waiting_for_qc
    end

    event :close do
      transition :waiting_for_qc => :closed
    end

  end


  # This create project of any particular type
  def self.create_project(params)

    project = Project.new
    project.title=params[:title]
    project.description = params[:descrip]
    project.amount = params[:price]
    project.duration=params[:duration]
    project.owner = User.current_user.id
    project.category = params[:proc_status]

    type = "Pictorial" #for now its pictorial, can be any
    project.save!

    params[:descriptions].each do |problem|
      project.problems << Pictorial.create_problem(problem, type,project)
    end
  end


end
