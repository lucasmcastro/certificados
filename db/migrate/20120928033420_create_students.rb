class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :cpf
      t.string :rg
      t.string :email
      t.string :phone1
      t.string :phone2
      t.string :phone3
      t.string :address
      t.string :zip
      t.string :neighborhood
      t.string :city
      t.string :sex
      t.date :birth_date
      t.string :occupation
      t.string :address_complement
      t.timestamps
    end
  end
end
