class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :position
      t.boolean :visible, default: false
      t.text :content
      t.string :content_type
      t.references :page, null: false, foreign_key: true

      t.timestamps
    end
  end
end
