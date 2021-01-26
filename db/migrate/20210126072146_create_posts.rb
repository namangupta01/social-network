class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :body
      t.references :user, foreign_key: { to_table: 'users' }, null: false
      t.timestamps
    end
  end
end
