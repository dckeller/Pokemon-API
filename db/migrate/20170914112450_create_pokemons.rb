class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.integer :pokedex, :null => false
      t.string  :name
      t.integer :height
      t.integer :weight
      t.string  :type
      t.integer :hp
      t.integer :attack
      t.integer :defense
      t.integer :speed

      t.timestamps
    end
  end
end
