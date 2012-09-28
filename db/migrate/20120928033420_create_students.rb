class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
