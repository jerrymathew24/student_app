class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :english
      t.integer :malayalam
      t.integer :social_studies
      t.integer :science
      t.integer :maths
      t.integer :total_score
      t.integer :rank

      t.timestamps
    end
  end
end
