class AddIndexesToCertificates < ActiveRecord::Migration
  def change
    add_index :certificates, :certifiable_id
    add_index :certificates, :certifiable_type
    add_index :certificates, :uuid
  end
end
