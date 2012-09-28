class CreateSendAttempts < ActiveRecord::Migration
  def change
    create_table :send_attempts do |t|
      t.string :message
      t.references :certificate

      t.timestamps
    end
    add_index :send_attempts, :certificate_id
  end
end
