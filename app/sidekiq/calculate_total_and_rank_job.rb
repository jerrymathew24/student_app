class CalculateTotalAndRankJob
  include Sidekiq::Job

  def perform(student_id)
    student = Student.find(student_id)
    student.total_score = student.english + student.malayalam + student.social_studies + student.science + student.maths
    student.save!

    update_ranks
  end

  def update_ranks
    students = Student.order(total_score: :desc)
    students.each_with_index do |student, index|
      student.update(rank: index + 1)
    end
  end
end
