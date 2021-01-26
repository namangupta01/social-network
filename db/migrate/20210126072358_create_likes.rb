class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :post, foreign_key: { to_table: 'posts' }, null: false, index: true
      t.references :user, foreign_key: { to_table: 'users' }, null: false, index: true
      t.timestamps
    end
  end
end
