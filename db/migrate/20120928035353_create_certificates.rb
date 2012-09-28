class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.references :student
      t.string :uuid
      t.string :event
      t.boolean :sent

      t.timestamps
    end
    add_index :certificates, :student_id
  end
end
