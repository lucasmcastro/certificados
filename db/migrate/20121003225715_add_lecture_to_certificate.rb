class AddLectureToCertificate < ActiveRecord::Migration
  def change
    add_column :certificates, :lecture, :string
  end
end
