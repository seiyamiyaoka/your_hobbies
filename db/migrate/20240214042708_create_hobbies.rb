class CreateHobbies < ActiveRecord::Migration[7.0]
  def change
    create_table :hobbies do |t|
      t.string :name, null: false, default: "", index: { unique: true }

      t.timestamps
    end
  end
end
