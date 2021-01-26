class CreateFollowerFolloweeMappings < ActiveRecord::Migration[6.1]
  def change
    create_table :follower_followee_mappings do |t|
      t.references :follower, foreign_key: { to_table: 'users' }, null: false
      t.references :followee, foreign_key: { to_table: 'users' }, null: false
      t.timestamps
    end
    add_index :follower_followee_mappings, [:follower_id, :followee_id], unique: true
  end
end
