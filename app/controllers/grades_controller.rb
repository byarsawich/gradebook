class GradesController < ApplicationController
  before_action :authenticate
  before_action :authorize_teacher
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  before_action :set_assignments, only: [:new, :edit]

  def index
    @student_id = params[:student_id]
    @grades = Grade.where(student_id: @student_id)
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
    redirect_to edit_grade_path(@grade)
  end

  # GET /grades/new
  def new
    @grade = Grade.new(student_id: params[:student_id])
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

    if @grade.save
      redirect_to grades_path, notice: 'Grade was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    if @grade.update(grade_params)
      redirect_to grades_path, notice: 'Grade was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    redirect_to grades_url, notice: 'Grade was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    def set_assignments
      @assignments = Assignment.where(teacher_id: Student.find(params[:student_id]).teacher_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:student_id, :assignment_id, :grade)
    end
end
