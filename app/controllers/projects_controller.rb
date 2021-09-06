# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show qa_show developer_show edit update destroy add_user remove_user add_bug]
  before_action :authenticate_user!

  # GET /projects or /projects.json
  def index
    @projects = current_user.projects
  end

  def bugs_bucket
    authorize Project
    @bugs = current_user.bugs.assigned.with_attached_screenshot
  end

  # GET /projects/1 or /projects/1.json
  def qa_show
    authorize Project
    @new_bugs = @project.bugs.new_bugs.with_attached_screenshot
    @assigned_bugs = @project.bugs.assigned.with_attached_screenshot
    @completed_bugs = @project.bugs.completed.with_attached_screenshot
  end

  def developer_show
    authorize Project
    @new_bugs = @project.bugs.new_bugs.with_attached_screenshot
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit

  end

  def create
    authorize Project
    @project = current_user.projects.create(project_params)

    respond_to do |format|
      format.html { redirect_to @project, notice: 'Project was successfully created.' }
      format.json { render :show, status: :created, location: @project }
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    authorize Project
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    authorize Project
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_user
    authorize Project
    @developer = User.developers.not_yet_added(@project.id)
    @qa = User.qas.not_yet_added(@project.id)
    if params[:user_id].present?
      @project.project_users.create(user_id: params[:user_id])
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'User was successfully added to project.' }
        format.json { head :no_content }
      end
    end
  end

  def remove_user
    authorize Project
    user = User.find(params[:user_id])
    if user.bugs.count > 0
      user.bugs.each do |bug|
        bug.update(status: 'new')
      end  
    end
    projectu = @project.project_users.find_by(user_id: params[:user_id])
    projectu.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'User was successfully removed from Project.' }
      format.json { head :no_content }
    end
  end

  def add_bug
    authorize Project
    @bug=Bug.new
  end

  def create_bug
    @project = Project.find(params[:id])
    @bug = @project.bugs.new(bug_params)
    respond_to do |format|
      if @bug.save
        format.html { redirect_to qa_show_url(@project.id), notice: 'Bug was successfully added.' }
        format.json { head :no_content }
      else
        format.html { render :add_bug, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }  
      end  
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

  def bug_params
    params.require(:bug).permit(:title, :deadline, :kind, :screenshot, :status)
  end
end
