class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id,  :null => false
      t.integer :pokemon_id, :null => false

      t.timestamps
    end
  end
end
