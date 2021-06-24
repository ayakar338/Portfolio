class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :number
      t.string  :option
      t.date    :plan_day
      t.string  :tel
      t.integer :price
      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.integer :email
      t.datetime :start_time

      t.timestamps
    end
  end
end
