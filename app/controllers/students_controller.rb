class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      CalculateTotalAndRankJob.perform_async(@student.id)
      redirect_to students_path
    else
      render :new
    end
  end

  def index
    @students = Student.order(:rank)
    render json: @students, only: [:name, :total_score, :rank]
  end

  private

  def student_params
    params.require(:student).permit(:name, :english, :malayalam, :social_studies, :science, :maths)
  end
end
