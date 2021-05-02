class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
    @team = Team.find(params[:id])
    @teamRelations = TeamMemberRelation.where(team_id: @team.id)
    @users = Array.new
    @teamRelations.each do |r|
      @users << User.find(r.user_id)
    end
    @teamRoles = Hash.new
    @teamRelations.each do |r|
      @teamRoles[r.user_id] = TeamRole.find(r.team_role_id).roleTitle
    end
  end

  def remove_member
    teamId = params[:id]
    userId =  params[:memberId]
    @team = Team.find(teamId)
    teamRelation = TeamMemberRelation.where(user_id: userId, team_id: teamId).limit(1)
    respond_to do |format|
      if TeamMemberRelation.destroy(teamRelation[0].id)
        format.html { redirect_to @team, notice: "Team was successfully deleted." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_member
    puts "#######################"
    userEmail = relation_params[:email]
    user = User.find_by_email(userEmail)
    newTeam_relation = TeamMemberRelation.new
    newTeam_relation.user_id = user.id
    newTeam_relation.team_id = params[:id]
    newTeam_relation.team_role_id = 3
    @team = Team.find(params[:id])
    respond_to do |format|
      if newTeam_relation.save
        format.html { redirect_to @team, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
    @teamRelations = TeamMemberRelation.where(team_id: @team.id)
    @users = Array.new
    @teamRelations.each do |r|
      @users << User.find(r.user_id)
    end
    @teamRoles = Hash.new
    @teamRelations.each do |r|
      @teamRoles[r.user_id] = TeamRole.find(r.team_role_id).roleTitle
    end
    @user = User.new
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
    newTeam = TeamMemberRelation.new()
    newTeam.team_id = @team.id
    newTeam.user_id = session[:user]
    newTeam.team_role_id = 1
    newTeam.save
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    allTeamRelation = TeamMemberRelation.where(team_id: @team.id)
    allTeamRelation.each do |r|
      r.destroy
    end
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name)
    end

  def relation_params
    params.require(:user).permit(:email)
  end
end
