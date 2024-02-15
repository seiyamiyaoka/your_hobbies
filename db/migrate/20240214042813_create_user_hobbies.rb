class CreateUserHobbies < ActiveRecord::Migration[7.0]
  def change
    create_table :user_hobbies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hobby, null: false, foreign_key: true

      t.timestamps
    end

    add_index :user_hobbies, [:user_id, :hobby_id], unique: true
  end
end
