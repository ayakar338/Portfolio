class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.float :rate
      t.text :text

      t.timestamps
    end
  end
end
