class AddCourseToCertificate < ActiveRecord::Migration
  def change
    add_column :certificates, :kind, :string
    add_column :certificates, :course, :string
    add_column :certificates, :start_date, :string
    add_column :certificates, :end_date, :string
    add_column :certificates, :duration, :string
    add_column :certificates, :topics, :string
    add_column :certificates, :course_code, :string
  end
end
