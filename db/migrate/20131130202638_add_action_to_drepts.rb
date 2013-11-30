class AddActionToDrepts < ActiveRecord::Migration
  def change
    add_column :drepts, :action, :string
  end
end
