class AddResumeToLecturer < ActiveRecord::Migration
  def change
    add_column :lecturers, :resume, :string
  end
end
