class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :body, null: false
      t.text :preview, null: false
      t.integer :author_id, null: false
      t.boolean :published, null: false, default: false

      t.timestamps
    end
  end
end
