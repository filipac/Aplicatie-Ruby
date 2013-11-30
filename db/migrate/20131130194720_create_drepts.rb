class CreateDrepts < ActiveRecord::Migration
  def change
    create_table :drepts do |t|
      t.string :numeDrept
      t.integer :user_id

      t.timestamps
    end
  end
end
