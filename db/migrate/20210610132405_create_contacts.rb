class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :email
      t.text :message
      t.datetime :created_at

      t.timestamps
    end
  end
end
