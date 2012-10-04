class PolymorphizeCertificate < ActiveRecord::Migration
  def up
    remove_index :certificates, :student_id
    rename_column :certificates, :student_id, :certifiable_id
    add_column :certificates, :certifiable_type, :string
    Certificate.reset_column_information
    Certificate.all.each do |c|
        c.update_column :certifiable_type, "Student"
    end
  end

  def down
  end
end
