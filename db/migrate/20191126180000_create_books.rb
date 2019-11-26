class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.text :description
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
