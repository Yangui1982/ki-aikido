class CreateNouvelles < ActiveRecord::Migration[7.0]
  def change
    create_table :nouvelles do |t|
      t.string :comment
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
