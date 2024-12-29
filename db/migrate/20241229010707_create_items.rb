class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.references :list, null: false, foreign_key: true
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
