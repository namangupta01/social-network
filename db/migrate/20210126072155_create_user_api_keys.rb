class CreateUserApiKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :user_api_keys do |t|
      t.references :user, foreign_key: { to_table: 'users' }, null: false, index: true
      t.string :user_access_token, null: false, index: true
      t.boolean :is_active, null: false, default: false
      t.datetime :expiry, null: false
      t.timestamps
    end
  end
end
