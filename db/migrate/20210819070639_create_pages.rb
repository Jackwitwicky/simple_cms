class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :name
      t.string :permalink
      t.integer :position
      t.boolean :visible, default: false
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
