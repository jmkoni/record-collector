class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :title
      t.belongs_to :artist
      t.integer :year
      t.integer :condition
      t.integer :genre

      t.timestamps
    end
  end
end
