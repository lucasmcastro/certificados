class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
