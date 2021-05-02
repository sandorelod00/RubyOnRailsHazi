class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    project_statuses = ProjectStatus.all
    @project_statuses_map = Hash.new
    project_statuses.each do |status|
      @project_statuses_map[status.id] = status.projectStatus
    end
  end

  # GET /projects/1 or /projects/1.json
  def show
    @team = Team.find(@project.team_id)
    project_statuses = ProjectStatus.all
    @project_statuses_map = Hash.new
    project_statuses.each do |status|
      @project_statuses_map[status.id] = status.projectStatus
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
    project_statuses = ProjectStatus.all
    @project_statuses_map = Hash.new
    project_statuses.each do |status|
      @project_statuses_map[status.id] = status.projectStatus
    end
    teams = Team.all
    @team_name_map = Hash.new
    teams.each do |team|
      @team_name_map[team.id] = team.name
    end
  end

  # GET /projects/1/edit
  def edit
    project_statuses = ProjectStatus.all
    @project_statuses_map = Hash.new
    project_statuses.each do |status|
      @project_statuses_map[status.id] = status.projectStatus
    end
    teams = Team.all
    @team_name_map = Hash.new
    teams.each do |team|
      @team_name_map[team.id] = team.name
    end
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    puts "#####################"
    puts project_params[:status_id]
    puts project_params[:team_id]
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :description, :team_id, :status_id, :due_date)
    end
end
