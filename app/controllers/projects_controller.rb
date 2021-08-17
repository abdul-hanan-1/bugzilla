class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy add_user remove_user]
  before_action :authenticate_user!

  # GET /projects or /projects.json
  def index
    @projects = current_user.projects
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = current_user.projects.create(project_params)

    respond_to do |format|
   
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
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
  def add_user
     @developer= User.developers.not_yet_added(@project.id)
     @qa= User.qas.not_yet_added(@project.id)
    if params[:user_id].present?
      
      @project.project_users.create(user_id: params[:user_id])
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'User was successfully added to book.' }
        format.json { head :no_content }
      end
    end
  end  
  def remove_user

    projectu = @project.project_users.find_by(user_id: params[:user_id])
    puts projectu
    projectu.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'User was successfully removed from Project.' }
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
      params.require(:project).permit(:title, :manager)
    end
end
