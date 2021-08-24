class BugsController < ApplicationController
  before_action :set_bug, only: %i[assign_bug show edit update destroy mark_completed]
  before_action :authenticate_user!
  # GET /bugs or /bugs.json
  def index
    @bugs = Bug.all
  end

  # GET /bugs/1 or /bugs/1.json
  def show
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
  end

  # GET /bugs/1/edit
  def edit
  end

  # POST /bugs or /bugs.json
  def create
    @bug = Bug.new(bug_params)

    respond_to do |format|
      if @bug.save
        format.html { redirect_to @bug, notice: "Bug was successfully created." }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bugs/1 or /bugs/1.json
  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to @bug, notice: "Bug was successfully updated." }
        format.json { render :show, status: :ok, location: @bug }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_bug   
     
      current_user.bug_users.create(bug_id: params[:id])
       if @bug.update(status: params[:status])
         redirect_to(request.referrer )
       end
    
  end
  def mark_completed   
     
       if @bug.update(status: params[:status])
         redirect_to(request.referrer )
    
     end
  end

  # DELETE /bugs/1 or /bugs/1.json
  def destroy
    if @bug.destroy
      redirect_to(request.referrer )
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bug_params
      params.require(:bug).permit(:title, :deadline, :kind, :screenshot,:status)
    end
end
