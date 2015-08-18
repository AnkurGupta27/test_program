class CreateProjectController < ApplicationController

  def index

    respond_to do |format|
      format.html
    end
  end

  def find
    @projects = Project.where(status: 'open')
    respond_to do |format|
      format.html
    end
  end


  def create
    if(validate_params(params))
      raise "All fields are mandatory!!"
    end
    Project.create_project(params)
    flash[:notice] = "Project Created Successfully"
    redirect_to "/create_project/index"
  end

  def validate_params(params)
    if (params[:title].present? && params[:descrip].present? && params[:price].present? && params[:duration].present? && params[:category].present? && params[:description].present?)
      return true
    end
    false
  end

  def pick_project
    p=Project.find(params[:project_id])
    p.assigned_to = User.current_user.id
    p.pick!
    flash[:notice] = "Work Picked Successfully!!!"
    redirect_to "/create_project/find"
  end


  def work_allocated
    @projects=Project.where(status: 'picked', assigned_to: User.current_user.id)
  end

  def do
    problems=Problem.where(project_id: params[:project_id])
    left_problems = []
    problems.length == problems.select{|a| left_problems << a if(!a.solutions.select{|b| b.solved_by==User.current_user.id }.present?)}
    if(left_problems.present?)
      @problem = left_problems.first
    end
  end

  def upload
    p=Problem.find(params[:problem_id])
    Solution.create!(problem_id: params[:problem_id],solved_by: User.current_user.id)
    problems=Problem.where(project_id: p.project_id)
    left_problems = []
    problems.length == problems.select{|a| left_problems << a if(!a.solutions.select{|b| b.solved_by==User.current_user.id }.present?)}
    if(!left_problems.present?)
      problems.first.project.pending_qc!
      flash[:notice]="Project Completed!! QC Pending!!!"
      redirect_to "/"
    else
      redirect_to "/create_project/do?project_id=#{p.project_id}"
    end
  end

end
