class CreateBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :breeds do |t|
      t.string :title
      t.text :sentence
      t.string :image_id
      t.integer :genre_id
      t.datetime :created_id
      t.datetime :updated_at

      t.timestamps
    end
  end
end
