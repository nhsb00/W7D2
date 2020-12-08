class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :record_id, null: false
      t.integer :year, null: false
      t.boolean :live, null: false, default: false

      t.timestamps
    end
    add_index :albums, :record_id, unique: true
  end
end
