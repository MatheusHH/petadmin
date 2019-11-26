class CreateBookServices < ActiveRecord::Migration[5.0]
  def change
    create_table :book_services do |t|
      t.references :book, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
