class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.integer :address
      t.integer :email
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
