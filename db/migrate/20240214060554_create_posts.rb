class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :circle, null: false, foreign_key: true
      t.text :content, null: false, default: ""

      t.timestamps
    end
  end
end
