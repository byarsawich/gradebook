class AssignmentsController < ApplicationController
  before_action :authenticate
  before_action :authorize_teacher
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]


  # GET /assignments/1
  # GET /assignments/1.json
  def show
    redirect_to edit_assignment_path(@assignment)
  end

  # GET /assignments/new
  def new
    @assignment = Assignment.new(teacher_id: Teacher.find_by(user_id: session[:user_id]).id)
  end

  # GET /assignments/1/edit
  def edit
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      redirect_to @teacher_index_path, notice: 'Assignment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /assignments/1
  # PATCH/PUT /assignments/1.json
  def update
    if @assignment.update(assignment_params)
      redirect_to teacher_index_path, notice: 'Assignment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment.destroy
    redirect_to teacher_index_path, notice: 'Assignment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:teacher_id, :name, :duedate)
    end
end
