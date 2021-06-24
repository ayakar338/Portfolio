class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
     t.references :article, foreign_key: true
     t.string :ip

      t.timestamps
    end
  end
end
