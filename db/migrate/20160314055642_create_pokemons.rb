class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :level
      t.references :trainer, index: true

      t.timestamps null: false
    end
    add_foreign_key :pokemons, :trainers
  end
end
