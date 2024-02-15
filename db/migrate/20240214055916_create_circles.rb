class CreateCircles < ActiveRecord::Migration[7.0]
  def change
    create_table :circles do |t|
      t.string :name, null: false, default: ""
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.references :hobby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
