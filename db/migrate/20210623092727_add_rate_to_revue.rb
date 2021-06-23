class AddRateToRevue < ActiveRecord::Migration[5.2]
  def change
    create_table :revues do |t|
     t.float :rate
   end
  end
end
