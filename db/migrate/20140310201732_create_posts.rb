class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :value
      t.string :category
      t.string :city
      t.string :state
      t.string :exchange
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, [:title]
    add_index :posts, [:category]
  end
end
