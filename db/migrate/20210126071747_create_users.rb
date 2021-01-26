class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true
      t.string :encrypted_password
      t.string :name, null: false
      t.uuid :uuid, null: false, default: 'uuid_generate_v4()'
      t.timestamps
    end
  end
end
